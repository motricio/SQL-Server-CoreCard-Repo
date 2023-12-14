USE [Admin]
GO
/****** Object:  StoredProcedure [dbo].[p_dba_collect_GLPostingTransactions_Load_Step2]    Script Date: 12/13/2023 8:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[p_dba_collect_GLPostingTransactions_Load_Step2] 
(@batchSize INT = 100000, @CommitSize INT = 10000)
AS
BEGIN
	SET NOCOUNT ON;
	--------------------------------------------------------------------------------------------STEP II-----------------------------------------------------------------------------------------------
	DECLARE @PVT INT = 0;
	PRINT '---- Batch load started at: '+convert(varchar(30),getdate(),121);
	WHILE (@PVT < @batchSize)
	BEGIN

				DROP TABLE IF EXISTS tempdb..#temp
				DECLARE @id_control INT


				DECLARE @results INT =1
				SELECT @id_control = MIN(RowNbr) from Admin.dbo.DBA_GLPostingTransactions_control WHERE loaded = 0
				
				--Load records into temp table
				create table #temp (RowNbr int NOT NULL, Skey [decimal](19, 0) NOT NULL, PostTime DATETIME NOT NULL)
				INSERT INTO #temp(RowNbr, Skey, PostTime) select RowNbr, [Skey], [PostTime] 
				from Admin.dbo.DBA_GLPostingTransactions_control
				where RowNbr between @id_control and (@id_control+@CommitSize-1)
	
				BEGIN TRY
					BEGIN TRAN
						SET IDENTITY_INSERT CoreIssue22.dbo.GLPostingTransactions_New ON                  
						-- Insert into GLPostingTransactions_New
						INSERT INTO CoreIssue22.dbo.GLPostingTransactions_New ([Skey], [AccountNumber], [BaseAcctid], [WalletAcctID], [TxnAcctId], [TranId], [AuthTranId], [TransactionLifeCycleUniqueID], [GLExternalTranRefNumber], [PostTime], [TransmissionDateTime], [SettlementDate], [TransactionAmount], [TransactionCurrencyCode], [SettlementAmount], [SettlementCurrencyCode], [MessageTypeIdentifier], [TxnSource], [CMTTRANTYPE], [MTCGrpName], [TransactionCode], [ActualTranCode], [GLGroupID], [DebitGL], [DebitGL_Currency], [CreditGL], [CreditGL_Currency], [DebitGL_Settlement], [DebitGL_Settlement_Currency], [CreditGL_Settlement], [CreditGL_Settlement_Currency], [ExchangeRate], [GLProductID], [InstitutionId], [TransactionsLogTime], [SweepStatus], [Reversed], [Authstatus], [TransactionDescription], [PeriodDateTime], [PostingFlag], [ProcCode], [SrcIdentifier], [CardNumber4Digits], [RevTgt], [ReimbursementFee_11], [FreeFormTextJapan], [RowCreatedDate], [RowChangedDate])
						SELECT GL.[Skey], GL.[AccountNumber], GL.[BaseAcctid], GL.[WalletAcctID], GL.[TxnAcctId], GL.[TranId], GL.[AuthTranId], GL.[TransactionLifeCycleUniqueID], GL.[GLExternalTranRefNumber], GL.[PostTime], GL.[TransmissionDateTime], GL.[SettlementDate], GL.[TransactionAmount], GL.[TransactionCurrencyCode], GL.[SettlementAmount], GL.[SettlementCurrencyCode], GL.[MessageTypeIdentifier], GL.[TxnSource], GL.[CMTTRANTYPE], GL.[MTCGrpName], GL.[TransactionCode], GL.[ActualTranCode], GL.[GLGroupID], GL.[DebitGL], GL.[DebitGL_Currency], GL.[CreditGL], GL.[CreditGL_Currency], GL.[DebitGL_Settlement], GL.[DebitGL_Settlement_Currency], GL.[CreditGL_Settlement], GL.[CreditGL_Settlement_Currency], GL.[ExchangeRate], GL.[GLProductID], GL.[InstitutionId], GL.[TransactionsLogTime], GL.[SweepStatus], GL.[Reversed], GL.[Authstatus], GL.[TransactionDescription], GL.[PeriodDateTime], GL.[PostingFlag], GL.[ProcCode], GL.[SrcIdentifier], GL.[CardNumber4Digits], GL.[RevTgt], GL.[ReimbursementFee_11], GL.[FreeFormTextJapan],t.[PostTime] as RowCreatedDate ,t.[PostTime] as RowChangedDate
						FROM CoreIssue_DBA.dbo.GLPostingTransactions GL INNER JOIN #temp t ON GL.Skey = t.Skey
	
						-- UPDATE DBA_GLPostingTransactions_control
						UPDATE C SET C.loaded = 1 
						FROM Admin.dbo.DBA_GLPostingTransactions_control C 
						INNER JOIN #temp t ON C.Skey = t.Skey
						SET @results = @@ROWCOUNT
						print '-- We have inserted: '+convert(varchar(10),@results)+'; '+'Loaded from: '+convert(varchar(10),@id_control)+' To: '+convert(varchar(10),@id_control+@results-1)	
						SET IDENTITY_INSERT CoreIssue22.dbo.GLPostingTransactions_New OFF 
					COMMIT TRAN
				END TRY
 
				BEGIN CATCH
					IF @@TRANCOUNT >= 1
					BEGIN  
						ROLLBACK TRAN
						SELECT  
					ERROR_NUMBER() AS ErrorNumber  
					,ERROR_SEVERITY() AS ErrorSeverity  
					,ERROR_STATE() AS ErrorState  
					,ERROR_PROCEDURE() AS ErrorProcedure  
					,ERROR_LINE() AS ErrorLine  
					,ERROR_MESSAGE() AS ErrorMessage;  
					BREAK;
					END
 
				   END CATCH
			   SET  @PVT = @PVT + @CommitSize;
			--
		END
		PRINT '---- Batch load completed at: '+convert(varchar(30),getdate(),121);
	--- End while
END
