USE [Admin]
GO

/****** Object:  StoredProcedure [dbo].[p_dba_collect_txn_log_usage]    Script Date: 12/15/2023 8:09:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[p_dba_collect_txn_log_usage]
AS
BEGIN
		SET NOCOUNT ON;
		DECLARE @TSQL AS NVARCHAR(2000);
		SET @TSQL = ''
		CREATE TABLE #TBL
			(
				[DataBaseName] varchar(200),
				[Log Size(MB)] decimal(32,6),
				[Log Space used(%)] decimal(32,6),
				[Status] varchar(5)
			);

		SET @TSQL='dbcc sqlperf(logspace)';
	
		INSERT INTO #TBL([DataBaseName],[Log Size(MB)],[Log Space used(%)],[Status])
		EXECUTE sp_executesql @TSQL;


		INSERT INTO [Admin].[dbo].[t_dba_txn_log_usage]([DataBaseName],[Log Size(MB)],[Log Space used(%)],[Status],[log_reuse_wait_desc],[recovery_model_desc])

		SELECT
			[A].[DataBaseName],
			[A].[Log Size(MB)],
			[A].[Log Space used(%)],
			[A].[Status],
			[B].[log_reuse_wait_desc],
			[B].[recovery_model_desc]
		FROM 
			#TBL AS A
			INNER JOIN sys.databases B ON (A.DataBaseName = B.name)
		order by 
		[Log Size(MB)] desc

		--select * from [Admin].[dbo].[t_dba_txn_log_usage]
		--where 
		--([DataBaseName] like isnull('%'+@DATABASE_NAME+'%',[DataBaseName]))
		--DROP TABLE #TBL

END
GO

