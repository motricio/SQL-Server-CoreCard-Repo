USE [Admin]
GO

/****** Object:  StoredProcedure [dbo].[p_dba_collect_GLPostingTransactions_Load_Step1]    Script Date: 12/14/2023 6:47:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[p_dba_collect_GLPostingTransactions_Load_Step1]
AS
BEGIN
	--------------------------------------------------------------------------------------------STEP I------------------------------------------------------------------------------------------------
	--Delete Control Tables before insert
	DELETE Admin.dbo.DBA_GLPostingTransactions_control 
	DELETE Admin.dbo.DBA_Partioning_Duplicates_Control WHERE [table] = 'GLPostingTransactions'


	--Find Duplicates TranID and Stored them in a Control Table for tracking purpose after Execution
	INSERT INTO Admin.dbo.DBA_Partioning_Duplicates_Control(TranId, [table])
	SELECT GL.TranId, 'GLPostingTransactions'
	FROM CoreIssue_DBA.DBO.GLPostingTransactions GL WITH(NOLOCK)
	INNER JOIN  CoreIssue_DBA.DBO.CCard_primary CP WITH(NOLOCK) ON CP.tranid = GL.TranId
	WHERE CP.[PostTime]> '2020-12-31 23:59:57.000'
	group by GL.TranId
	having count (GL.TranId) >1
	

	--Find records need to insert on _New table, duplicates row have not included
	INSERT INTO Admin.dbo.DBA_GLPostingTransactions_control(RowNbr, Skey, Tranid, PostTime, loaded)
	select distinct ROW_NUMBER() over(order by GL.[Skey]) as 'RowNbr', GL.[Skey], GL.Tranid, CP.[PostTime], 0 AS loaded
	FROM CoreIssue_DBA.dbo.CCard_primary CP WITH(NOLOCK) INNER JOIN  CoreIssue_DBA.dbo.GLPostingTransactions GL WITH(NOLOCK) ON CP.tranid = GL.TranId
	LEFT JOIN Admin.dbo.DBA_Partioning_Duplicates_Control D ON GL.TranId = D.TranId
	WHERE CP.[PostTime]> '2020-12-31 23:59:57.000'---462729
	AND D.TranId IS NULL
	
END
GO
