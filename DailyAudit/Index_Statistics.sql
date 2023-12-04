drop table if exists tempdb..#temp
SELECT 
DISTINCT 
@@servername as servername,
j.Name AS job_name,
CASE WHEN j.enabled = 1 THEN 
'ENABLED'
ELSE 'DISABELD' 
END AS job_status,
convert( datetime,
         convert(varchar, jh.run_date/10000)+'/'+
         convert(varchar, jh.run_date%1000/100)+'/'+
         convert(varchar, jh.run_date%100)+' '+
         convert(varchar, jh.run_time/10000)+':'+
         convert(varchar, jh.run_time%10000/100)+':'+
         convert(varchar, jh.run_time%100)+'.000' ) AS LastRunDateTime,
jh.run_duration,
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
as [duration (hh:mm:ss)],
CASE
WHEN jh.run_status = 0 THEN 'Failed' 
WHEN jh.run_status = 1 THEN 'Succeeded' 
WHEN jh.run_status = 2 THEN 'Retry' 
WHEN jh.run_status = 3 THEN 'Canceled' 
WHEN jh.run_status = 4 THEN 'In Progress' 
END as Outcome, 
jh.message
into #temp
FROM msdb..sysjobhistory jh, msdb..sysjobs j
WHERE jh.job_id = j.job_id AND j.Name 
in ('DBA - Maint - Update Statistics','DBA - Maint - Index Defrag - Large Indexes.','DBA - Maint - Index Defrag - Small Indexes')  
--AND run_status = 1
AND instance_id = (SELECT MAX(jhm.instance_id) FROM msdb..sysjobhistory jhm WHERE jh.job_id = jhm.job_id)


select job_name, job_status, LastRunDateTime, [duration (hh:mm:ss)],Outcome,message from #temp order by [servername] asc


--select * from msdb..sysjobhistory


