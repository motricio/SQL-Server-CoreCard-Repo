USE [Admin]
GO
/****** Object:  StoredProcedure [dbo].[p_dba_collect_active_sessions_resource_usage]    Script Date: 12/15/2023 5:27:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mauricio Rodriguez R.
-- Create date: 2023-12-12
-- Description:	p_dba_show_active_sessions_resource_usage
-- =============================================
ALTER PROCEDURE [dbo].[p_dba_show_active_sessions_resource_usage]
(
	@SECONDS INT=30, @SESSION_ID INT= null
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @i INT = 1;
	WHILE (@i <= @SECONDS)
		BEGIN
		WAITFOR DELAY '00:00:01'
			exec [p_dba_collect_active_sessions_resource_usage] @SESSION_ID
			print 'Completed time capture Interval #: '+ cast(@i as varchar(2)) +', Date Captured: ' + convert(varchar(30),getdate(),121)
		SET  @i = @i + 1;
	END 
	print 'Completed collect active sessions resource usage.'
	select * from t_dba_show_active_sessions_resource_usage
END
