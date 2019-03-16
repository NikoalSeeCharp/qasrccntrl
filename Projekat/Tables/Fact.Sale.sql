SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Fact].[Sale] (
		[Sale Key]                 [bigint] IDENTITY(1, 1) NOT NULL,
		[City Key]                 [int] NOT NULL,
		[Customer Key]             [int] NOT NULL,
		[Bill To Customer Key]     [int] NOT NULL,
		[Stock Item Key]           [int] NOT NULL,
		[Invoice Date Key]         [date] NOT NULL,
		[Delivery Date Key]        [date] NULL,
		[Salesperson Key]          [int] NOT NULL,
		[WWI Invoice ID]           [int] NOT NULL,
		[Description]              [nvarchar](100) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Package]                  [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Quantity]                 [int] NOT NULL,
		[Unit Price]               [decimal](18, 2) NOT NULL,
		[Tax Rate]                 [decimal](18, 3) NOT NULL,
		[Total Excluding Tax]      [decimal](18, 2) NOT NULL,
		[Tax Amount]               [decimal](18, 2) NOT NULL,
		[Profit]                   [decimal](18, 2) NOT NULL,
		[Total Including Tax]      [decimal](18, 2) NOT NULL,
		[Total Dry Items]          [int] NOT NULL,
		[Total Chiller Items]      [int] NOT NULL,
		[Lineage Key]              [int] NOT NULL,
		CONSTRAINT [PK_Fact_Sale]
		PRIMARY KEY
		NONCLUSTERED
		([Sale Key], [Invoice Date Key])
	ON [PS_Date] ([Invoice Date Key])
) ON [PS_Date] ([Invoice Date Key])
GO
ALTER TABLE [Fact].[Sale]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Sale_City_Key_Dimension_City]
	FOREIGN KEY ([City Key]) REFERENCES [Dimension].[City] ([City Key])
ALTER TABLE [Fact].[Sale]
	CHECK CONSTRAINT [FK_Fact_Sale_City_Key_Dimension_City]

GO
ALTER TABLE [Fact].[Sale]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Sale_Customer_Key_Dimension_Customer]
	FOREIGN KEY ([Customer Key]) REFERENCES [Dimension].[Customer] ([Customer Key])
ALTER TABLE [Fact].[Sale]
	CHECK CONSTRAINT [FK_Fact_Sale_Customer_Key_Dimension_Customer]

GO
ALTER TABLE [Fact].[Sale]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Sale_Bill_To_Customer_Key_Dimension_Customer]
	FOREIGN KEY ([Bill To Customer Key]) REFERENCES [Dimension].[Customer] ([Customer Key])
ALTER TABLE [Fact].[Sale]
	CHECK CONSTRAINT [FK_Fact_Sale_Bill_To_Customer_Key_Dimension_Customer]

GO
ALTER TABLE [Fact].[Sale]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Sale_Stock_Item_Key_Dimension_Stock Item]
	FOREIGN KEY ([Stock Item Key]) REFERENCES [Dimension].[Stock Item] ([Stock Item Key])
ALTER TABLE [Fact].[Sale]
	CHECK CONSTRAINT [FK_Fact_Sale_Stock_Item_Key_Dimension_Stock Item]

GO
ALTER TABLE [Fact].[Sale]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Sale_Invoice_Date_Key_Dimension_Date]
	FOREIGN KEY ([Invoice Date Key]) REFERENCES [Dimension].[Date] ([Date])
ALTER TABLE [Fact].[Sale]
	CHECK CONSTRAINT [FK_Fact_Sale_Invoice_Date_Key_Dimension_Date]

GO
ALTER TABLE [Fact].[Sale]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Sale_Delivery_Date_Key_Dimension_Date]
	FOREIGN KEY ([Delivery Date Key]) REFERENCES [Dimension].[Date] ([Date])
ALTER TABLE [Fact].[Sale]
	CHECK CONSTRAINT [FK_Fact_Sale_Delivery_Date_Key_Dimension_Date]

GO
ALTER TABLE [Fact].[Sale]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Sale_Salesperson_Key_Dimension_Employee]
	FOREIGN KEY ([Salesperson Key]) REFERENCES [Dimension].[Employee] ([Employee Key])
ALTER TABLE [Fact].[Sale]
	CHECK CONSTRAINT [FK_Fact_Sale_Salesperson_Key_Dimension_Employee]

GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCX_Fact_Sale]
	ON [Fact].[Sale]
	ON [PS_Date] ([Invoice Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Sale_Bill_To_Customer_Key]
	ON [Fact].[Sale] ([Bill To Customer Key])
	ON [PS_Date] ([Invoice Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Sale_City_Key]
	ON [Fact].[Sale] ([City Key])
	ON [PS_Date] ([Invoice Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Sale_Customer_Key]
	ON [Fact].[Sale] ([Customer Key])
	ON [PS_Date] ([Invoice Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Sale_Delivery_Date_Key]
	ON [Fact].[Sale] ([Delivery Date Key])
	ON [PS_Date] ([Invoice Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Sale_Invoice_Date_Key]
	ON [Fact].[Sale] ([Invoice Date Key])
	ON [PS_Date] ([Invoice Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Sale_Salesperson_Key]
	ON [Fact].[Sale] ([Salesperson Key])
	ON [PS_Date] ([Invoice Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Sale_Stock_Item_Key]
	ON [Fact].[Sale] ([Stock Item Key])
	ON [PS_Date] ([Invoice Date Key])
GO
EXEC sp_addextendedproperty N'Description', N'Sale fact table (invoiced sales to customers)', 'SCHEMA', N'Fact', 'TABLE', N'Sale', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'DW key for a row in the Sale fact', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'Sale Key'
GO
EXEC sp_addextendedproperty N'Description', N'City for this invoice', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'City Key'
GO
EXEC sp_addextendedproperty N'Description', N'Customer for this invoice', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'Customer Key'
GO
EXEC sp_addextendedproperty N'Description', N'Bill To Customer for this invoice', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'Bill To Customer Key'
GO
EXEC sp_addextendedproperty N'Description', N'Stock item for this invoice', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'Stock Item Key'
GO
EXEC sp_addextendedproperty N'Description', N'Invoice date for this invoice', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'Invoice Date Key'
GO
EXEC sp_addextendedproperty N'Description', N'Date that these items were delivered', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'Delivery Date Key'
GO
EXEC sp_addextendedproperty N'Description', N'Salesperson for this invoice', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'Salesperson Key'
GO
EXEC sp_addextendedproperty N'Description', N'InvoiceID in source system', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'WWI Invoice ID'
GO
EXEC sp_addextendedproperty N'Description', N'Description of the item supplied (Usually the stock item name but can be overridden)', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'Description'
GO
EXEC sp_addextendedproperty N'Description', N'Type of package supplied', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'Package'
GO
EXEC sp_addextendedproperty N'Description', N'Quantity supplied', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'Quantity'
GO
EXEC sp_addextendedproperty N'Description', N'Unit price charged', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'Unit Price'
GO
EXEC sp_addextendedproperty N'Description', N'Tax rate applied', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'Tax Rate'
GO
EXEC sp_addextendedproperty N'Description', N'Total amount excluding tax', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'Total Excluding Tax'
GO
EXEC sp_addextendedproperty N'Description', N'Total amount of tax', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'Tax Amount'
GO
EXEC sp_addextendedproperty N'Description', N'Total amount of profit', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'Profit'
GO
EXEC sp_addextendedproperty N'Description', N'Total amount including tax', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'Total Including Tax'
GO
EXEC sp_addextendedproperty N'Description', N'Total number of dry items', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'Total Dry Items'
GO
EXEC sp_addextendedproperty N'Description', N'Total number of chiller items', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'Total Chiller Items'
GO
EXEC sp_addextendedproperty N'Description', N'Lineage Key for the data load for this row', 'SCHEMA', N'Fact', 'TABLE', N'Sale', 'COLUMN', N'Lineage Key'
GO
ALTER TABLE [Fact].[Sale] SET (LOCK_ESCALATION = TABLE)
GO
