SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Dimension].[Transaction Type] (
		[Transaction Type Key]        [int] NOT NULL,
		[WWI Transaction Type ID]     [int] NOT NULL,
		[Transaction Type]            [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Valid From]                  [datetime2](7) NOT NULL,
		[Valid To]                    [datetime2](7) NOT NULL,
		[Lineage Key]                 [int] NOT NULL,
		CONSTRAINT [PK_Dimension_Transaction_Type]
		PRIMARY KEY
		CLUSTERED
		([Transaction Type Key])
	ON [USERDATA]
) ON [USERDATA]
GO
ALTER TABLE [Dimension].[Transaction Type]
	ADD
	CONSTRAINT [DF_Dimension_Transaction_Type_Transaction_Type_Key]
	DEFAULT (NEXT VALUE FOR [Sequences].[TransactionTypeKey]) FOR [Transaction Type Key]
GO
CREATE NONCLUSTERED INDEX [IX_Dimension_Transaction_Type_WWITransactionTypeID]
	ON [Dimension].[Transaction Type] ([WWI Transaction Type ID], [Valid From], [Valid To])
	ON [USERDATA]
GO
EXEC sp_addextendedproperty N'Description', N'Allows quickly locating by WWI ID', 'SCHEMA', N'Dimension', 'TABLE', N'Transaction Type', 'INDEX', N'IX_Dimension_Transaction_Type_WWITransactionTypeID'
GO
EXEC sp_addextendedproperty N'Description', N'TransactionType dimension', 'SCHEMA', N'Dimension', 'TABLE', N'Transaction Type', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'DW key for the transaction type dimension', 'SCHEMA', N'Dimension', 'TABLE', N'Transaction Type', 'COLUMN', N'Transaction Type Key'
GO
EXEC sp_addextendedproperty N'Description', N'Numeric ID used for reference to a transaction type within the WWI database', 'SCHEMA', N'Dimension', 'TABLE', N'Transaction Type', 'COLUMN', N'WWI Transaction Type ID'
GO
EXEC sp_addextendedproperty N'Description', N'Full name of the transaction type', 'SCHEMA', N'Dimension', 'TABLE', N'Transaction Type', 'COLUMN', N'Transaction Type'
GO
EXEC sp_addextendedproperty N'Description', N'Valid from this date and time', 'SCHEMA', N'Dimension', 'TABLE', N'Transaction Type', 'COLUMN', N'Valid From'
GO
EXEC sp_addextendedproperty N'Description', N'Valid until this date and time', 'SCHEMA', N'Dimension', 'TABLE', N'Transaction Type', 'COLUMN', N'Valid To'
GO
EXEC sp_addextendedproperty N'Description', N'Lineage Key for the data load for this row', 'SCHEMA', N'Dimension', 'TABLE', N'Transaction Type', 'COLUMN', N'Lineage Key'
GO
ALTER TABLE [Dimension].[Transaction Type] SET (LOCK_ESCALATION = TABLE)
GO
