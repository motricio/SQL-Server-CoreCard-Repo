drop table if exists tempdb..#LastBackup
drop table if exists tempdb..#temp
SELECT
@@servername as servername,
MAX(backup_set_id) AS backup_set_id,
database_name, 
CASE 
        WHEN type = 'D' THEN 'Full Database'
        WHEN type = 'I' THEN 'Differential database backup'
        WHEN type = 'L' THEN 'Transaction Log'
END AS BackupType
--CONVERT(DECIMAL(10, 2), backup_size / 1024. / 1024.) as backup_size_mb,
,MAX(backup_start_date) as BackupDate
into #LastBackup
FROM 
msdb.dbo.backupset 
WHERE 
media_set_id IN (SELECT media_set_id FROM msdb.dbo.backupmediafamily )
AND type in ('D','I','L')
GROUP BY  database_name,type




SELECT 
DISTINCT 
@@servername as servername,
j.Name AS job_name,
CASE WHEN j.enabled = 1 THEN 
'ENABLED'
ELSE 'DISABELD' 
END AS job_status,
jh.run_date AS last_run_date, jh.run_duration,
case LEN(jh.run_duration)
when 6 then
	left(cast(jh.run_duration as varchar(10)),2)+':'+
	substring(cast(jh.run_duration as varchar(10)),2,2) +':'+
	substring(cast(jh.run_duration as varchar(10)),4,2)
when 5 then
	'0'+left(cast(jh.run_duration as varchar(10)),1)+':'+
	substring(cast(jh.run_duration as varchar(10)),2,2) +':'+
	substring(cast(jh.run_duration as varchar(10)),4,2)
when 4 then
	'00:'+left(cast(jh.run_duration as varchar(10)),2)+':'+
	substring(cast(jh.run_duration as varchar(10)),2,2)
when 3 then
	'00:0'+left(cast(jh.run_duration as varchar(10)),1)+':'+
	substring(cast(jh.run_duration as varchar(10)),2,2)
else '00:00:'+cast(jh.run_duration as varchar(10))
end
as [duration (hh:mm:ss)]
into #temp
FROM sysjobhistory jh, sysjobs j
WHERE jh.job_id = j.job_id AND j.Name 
in ('DBA - Maint - FullBackup_Multistripes','DBA - Maint - DiffBackup_Multistripes','DBA - Maint - LogBackup_Multistripes')  
AND run_status = 1
AND instance_id = (SELECT MAX(jhm.instance_id) FROM sysjobhistory jhm WHERE jh.job_id = jhm.job_id)

select 
t.BackupType, 
MAX(CONVERT(date, t.BackupDate, 23)) as BackupDate,
(SUM(backup_size)) /1024 / 1024 / 1024 As BackupSizeInGBs,
(SUM(bs.compressed_backup_size)) /1024 / 1024 / 1024 As CompressedBackupSizeInGBs
from #LastBackup t inner join msdb.dbo.backupset bs on t.backup_set_id = bs.backup_set_id
group by t.[servername], t.BackupType
order by t.[servername] desc,   t.BackupType asc

select job_name, job_status, last_run_date, [duration (hh:mm:ss)] from #temp order by [servername] asc



