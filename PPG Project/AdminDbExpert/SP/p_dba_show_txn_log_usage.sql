USE [Admin]
GO

/****** Object:  StoredProcedure [dbo].[p_dba_show_txn_log_usage]    Script Date: 12/15/2023 8:10:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[p_dba_show_txn_log_usage]
(
	@DATABASE_NAME VARCHAR(20)= Null,
	@DateCaptureStart Datetime=null,
	@DateCaptureEnd Datetime=null
)
AS
BEGIN
		SELECT [DataBaseName]
			  ,[Log Size(MB)]
			  ,[Log Space used(%)]
			  ,[Status]
			  ,[log_reuse_wait_desc]
			  ,[recovery_model_desc]
			  ,[DateCapture]
		  FROM [dbo].[t_dba_txn_log_usage]
		where 
		([DataBaseName] like isnull('%'+@DATABASE_NAME+'%',[DataBaseName]))
		AND	([DateCapture] >= isnull(@DateCaptureStart,[DateCapture]))
		AND	([DateCapture] <= isnull(@DateCaptureEnd,[DateCapture]))
END
GO

