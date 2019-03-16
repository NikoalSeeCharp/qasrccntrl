SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Fact].[Transaction] (
		[Transaction Key]                 [bigint] IDENTITY(1, 1) NOT NULL,
		[Date Key]                        [date] NOT NULL,
		[Customer Key]                    [int] NULL,
		[Bill To Customer Key]            [int] NULL,
		[Supplier Key]                    [int] NULL,
		[Transaction Type Key]            [int] NOT NULL,
		[Payment Method Key]              [int] NULL,
		[WWI Customer Transaction ID]     [int] NULL,
		[WWI Supplier Transaction ID]     [int] NULL,
		[WWI Invoice ID]                  [int] NULL,
		[WWI Purchase Order ID]           [int] NULL,
		[Supplier Invoice Number]         [nvarchar](20) COLLATE Latin1_General_100_CI_AS NULL,
		[Total Excluding Tax]             [decimal](18, 2) NOT NULL,
		[Tax Amount]                      [decimal](18, 2) NOT NULL,
		[Total Including Tax]             [decimal](18, 2) NOT NULL,
		[Outstanding Balance]             [decimal](18, 2) NOT NULL,
		[Is Finalized]                    [bit] NOT NULL,
		[Lineage Key]                     [int] NOT NULL,
		CONSTRAINT [PK_Fact_Transaction]
		PRIMARY KEY
		NONCLUSTERED
		([Transaction Key], [Date Key])
	ON [PS_Date] ([Date Key])
) ON [PS_Date] ([Date Key])
GO
ALTER TABLE [Fact].[Transaction]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Transaction_Date_Key_Dimension_Date]
	FOREIGN KEY ([Date Key]) REFERENCES [Dimension].[Date] ([Date])
ALTER TABLE [Fact].[Transaction]
	CHECK CONSTRAINT [FK_Fact_Transaction_Date_Key_Dimension_Date]

GO
ALTER TABLE [Fact].[Transaction]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Transaction_Customer_Key_Dimension_Customer]
	FOREIGN KEY ([Customer Key]) REFERENCES [Dimension].[Customer] ([Customer Key])
ALTER TABLE [Fact].[Transaction]
	CHECK CONSTRAINT [FK_Fact_Transaction_Customer_Key_Dimension_Customer]

GO
ALTER TABLE [Fact].[Transaction]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Transaction_Bill_To_Customer_Key_Dimension_Customer]
	FOREIGN KEY ([Bill To Customer Key]) REFERENCES [Dimension].[Customer] ([Customer Key])
ALTER TABLE [Fact].[Transaction]
	CHECK CONSTRAINT [FK_Fact_Transaction_Bill_To_Customer_Key_Dimension_Customer]

GO
ALTER TABLE [Fact].[Transaction]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Transaction_Supplier_Key_Dimension_Supplier]
	FOREIGN KEY ([Supplier Key]) REFERENCES [Dimension].[Supplier] ([Supplier Key])
ALTER TABLE [Fact].[Transaction]
	CHECK CONSTRAINT [FK_Fact_Transaction_Supplier_Key_Dimension_Supplier]

GO
ALTER TABLE [Fact].[Transaction]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Transaction_Transaction_Type_Key_Dimension_Transaction Type]
	FOREIGN KEY ([Transaction Type Key]) REFERENCES [Dimension].[Transaction Type] ([Transaction Type Key])
ALTER TABLE [Fact].[Transaction]
	CHECK CONSTRAINT [FK_Fact_Transaction_Transaction_Type_Key_Dimension_Transaction Type]

GO
ALTER TABLE [Fact].[Transaction]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Transaction_Payment_Method_Key_Dimension_Payment Method]
	FOREIGN KEY ([Payment Method Key]) REFERENCES [Dimension].[Payment Method] ([Payment Method Key])
ALTER TABLE [Fact].[Transaction]
	CHECK CONSTRAINT [FK_Fact_Transaction_Payment_Method_Key_Dimension_Payment Method]

GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCX_Fact_Transaction]
	ON [Fact].[Transaction]
	ON [PS_Date] ([Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Transaction_Bill_To_Customer_Key]
	ON [Fact].[Transaction] ([Bill To Customer Key])
	ON [PS_Date] ([Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Transaction_Customer_Key]
	ON [Fact].[Transaction] ([Customer Key])
	ON [PS_Date] ([Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Transaction_Date_Key]
	ON [Fact].[Transaction] ([Date Key])
	ON [PS_Date] ([Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Transaction_Payment_Method_Key]
	ON [Fact].[Transaction] ([Payment Method Key])
	ON [PS_Date] ([Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Transaction_Supplier_Key]
	ON [Fact].[Transaction] ([Supplier Key])
	ON [PS_Date] ([Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Transaction_Transaction_Type_Key]
	ON [Fact].[Transaction] ([Transaction Type Key])
	ON [PS_Date] ([Date Key])
GO
EXEC sp_addextendedproperty N'Description', N'Transaction fact table (financial transactions involving customers and supppliers)', 'SCHEMA', N'Fact', 'TABLE', N'Transaction', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'DW key for a row in the Transaction fact', 'SCHEMA', N'Fact', 'TABLE', N'Transaction', 'COLUMN', N'Transaction Key'
GO
EXEC sp_addextendedproperty N'Description', N'Transaction date', 'SCHEMA', N'Fact', 'TABLE', N'Transaction', 'COLUMN', N'Date Key'
GO
EXEC sp_addextendedproperty N'Description', N'Customer (if applicable)', 'SCHEMA', N'Fact', 'TABLE', N'Transaction', 'COLUMN', N'Customer Key'
GO
EXEC sp_addextendedproperty N'Description', N'Bill to customer (if applicable)', 'SCHEMA', N'Fact', 'TABLE', N'Transaction', 'COLUMN', N'Bill To Customer Key'
GO
EXEC sp_addextendedproperty N'Description', N'Supplier (if applicable)', 'SCHEMA', N'Fact', 'TABLE', N'Transaction', 'COLUMN', N'Supplier Key'
GO
EXEC sp_addextendedproperty N'Description', N'Type of transaction', 'SCHEMA', N'Fact', 'TABLE', N'Transaction', 'COLUMN', N'Transaction Type Key'
GO
EXEC sp_addextendedproperty N'Description', N'Payment method (if applicable)', 'SCHEMA', N'Fact', 'TABLE', N'Transaction', 'COLUMN', N'Payment Method Key'
GO
EXEC sp_addextendedproperty N'Description', N'Customer transaction ID in source system', 'SCHEMA', N'Fact', 'TABLE', N'Transaction', 'COLUMN', N'WWI Customer Transaction ID'
GO
EXEC sp_addextendedproperty N'Description', N'Supplier transaction ID in source system', 'SCHEMA', N'Fact', 'TABLE', N'Transaction', 'COLUMN', N'WWI Supplier Transaction ID'
GO
EXEC sp_addextendedproperty N'Description', N'Invoice ID in source system', 'SCHEMA', N'Fact', 'TABLE', N'Transaction', 'COLUMN', N'WWI Invoice ID'
GO
EXEC sp_addextendedproperty N'Description', N'Purchase order ID in source system', 'SCHEMA', N'Fact', 'TABLE', N'Transaction', 'COLUMN', N'WWI Purchase Order ID'
GO
EXEC sp_addextendedproperty N'Description', N'Supplier invoice number (if applicable)', 'SCHEMA', N'Fact', 'TABLE', N'Transaction', 'COLUMN', N'Supplier Invoice Number'
GO
EXEC sp_addextendedproperty N'Description', N'Total amount excluding tax', 'SCHEMA', N'Fact', 'TABLE', N'Transaction', 'COLUMN', N'Total Excluding Tax'
GO
EXEC sp_addextendedproperty N'Description', N'Total amount of tax', 'SCHEMA', N'Fact', 'TABLE', N'Transaction', 'COLUMN', N'Tax Amount'
GO
EXEC sp_addextendedproperty N'Description', N'Total amount including tax', 'SCHEMA', N'Fact', 'TABLE', N'Transaction', 'COLUMN', N'Total Including Tax'
GO
EXEC sp_addextendedproperty N'Description', N'Amount still outstanding for this transaction', 'SCHEMA', N'Fact', 'TABLE', N'Transaction', 'COLUMN', N'Outstanding Balance'
GO
EXEC sp_addextendedproperty N'Description', N'Has this transaction been finalized?', 'SCHEMA', N'Fact', 'TABLE', N'Transaction', 'COLUMN', N'Is Finalized'
GO
EXEC sp_addextendedproperty N'Description', N'Lineage Key for the data load for this row', 'SCHEMA', N'Fact', 'TABLE', N'Transaction', 'COLUMN', N'Lineage Key'
GO
ALTER TABLE [Fact].[Transaction] SET (LOCK_ESCALATION = TABLE)
GO
