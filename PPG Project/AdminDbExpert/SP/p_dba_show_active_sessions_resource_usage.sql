USE [Admin]
GO

/****** Object:  StoredProcedure [dbo].[p_dba_show_active_sessions_resource_usage]    Script Date: 12/14/2023 7:34:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mauricio Rodriguez R.
-- Create date: 2023-12-12
-- Description:	p_dba_show_active_sessions_resource_usage
-- =============================================
CREATE PROCEDURE [dbo].[p_dba_show_active_sessions_resource_usage]
(
	@SESSION_ID INT=NULL, @LOGIN_NAME VARCHAR(20) = NULL
)
AS
BEGIN
			INSERT INTO [dbo].[t_dba_show_active_sessions_resource_usage]
           ([SessionID],[DatabaseName],[LoginName],[HostName],[ProgramName],[status],[transaction_isolation_level],[login_time],[last_request_start_time]
           ,[BlockedBySessionID],[GrantedQueryMemoryKB],[Cpu_Score],[WaitType],[Reads],[Writes],[LogicalReads],[PendingIOCount],[RowCount])
        	SELECT 
				Sessions.session_id AS SessionID, 
				databases.name AS DatabaseName,
				Sessions.login_name AS LoginName, Sessions.host_name AS HostName, Sessions.program_name AS ProgramName,
				Sessions.status,
				CASE Sessions.transaction_isolation_level 
				WHEN 0 THEN 'Unspecified'
				WHEN 1 THEN 'ReadUncomitted'
				WHEN 2 THEN 'ReadCommitted'
				WHEN 3 THEN 'Repeatable'
				WHEN 4 THEN 'Serializable'
				WHEN 5 THEN 'Snapshot'
				END as transaction_isolation_level,
				Sessions.login_time as login_time,
				--Sessions.total_elapsed_time as total_elapsed_time_ss,
				sessions.last_request_start_time,
				Requests.blocking_session_id AS BlockedBySessionID,
				Requests.granted_query_memory*8 AS GrantedQueryMemoryKB,
				CONVERT(BigInt, (Requests.cpu_time+1))*CONVERT(BigInt, (Requests.reads*10+Requests.writes*10+Requests.logical_reads+1)) AS Score,
				Requests.wait_type AS WaitType,
				Requests.reads AS Reads, Requests.writes AS Writes, Requests.logical_reads AS LogicalReads,
				dm_os_tasks.PendingIOCount, Requests.row_count AS [RowCount]
			FROM
				sys.dm_exec_sessions AS Sessions
				JOIN sys.dm_exec_requests AS Requests ON Sessions.session_id=Requests.session_id
				LEFT OUTER JOIN sys.databases ON Requests.database_id=databases.database_id
				LEFT OUTER JOIN (
					SELECT blocking_session_id, COUNT(*) AS BlockingRequestCount FROM sys.dm_exec_requests GROUP BY blocking_session_id
				) AS BlockRequests ON Requests.session_id=BlockRequests.blocking_session_id
				LEFT OUTER JOIN (
					SELECT request_id, session_id, SUM(pending_io_count) AS PendingIOCount
					FROM sys.dm_os_tasks WITH (NOLOCK)
					GROUP BY request_id, session_id
				) AS dm_os_tasks ON
					Requests.request_id=dm_os_tasks.request_id
					AND Requests.session_id=dm_os_tasks.session_id
				CROSS APPLY sys.dm_exec_sql_text(sql_handle) AS Statements
				CROSS APPLY sys.dm_exec_query_plan(plan_handle) AS QueryPlans
				CROSS APPLY sys.dm_exec_sql_text(sql_handle) AS BlockingSessionQuery
			where 
					([Sessions].[session_id]= isnull(@SESSION_ID,[Sessions].[session_id]))
				or	([Sessions].[login_name]= isnull(@LOGIN_NAME,[Sessions].[login_name]))
			order by Score desc
END
GO

