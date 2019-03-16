SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Fact].[Movement] (
		[Movement Key]                      [bigint] IDENTITY(1, 1) NOT NULL,
		[Date Key]                          [date] NOT NULL,
		[Stock Item Key]                    [int] NOT NULL,
		[Customer Key]                      [int] NULL,
		[Supplier Key]                      [int] NULL,
		[Transaction Type Key]              [int] NOT NULL,
		[WWI Stock Item Transaction ID]     [int] NOT NULL,
		[WWI Invoice ID]                    [int] NULL,
		[WWI Purchase Order ID]             [int] NULL,
		[Quantity]                          [int] NOT NULL,
		[Lineage Key]                       [int] NOT NULL,
		CONSTRAINT [PK_Fact_Movement]
		PRIMARY KEY
		NONCLUSTERED
		([Movement Key], [Date Key])
	ON [PS_Date] ([Date Key])
) ON [PS_Date] ([Date Key])
GO
ALTER TABLE [Fact].[Movement]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Movement_Date_Key_Dimension_Date]
	FOREIGN KEY ([Date Key]) REFERENCES [Dimension].[Date] ([Date])
ALTER TABLE [Fact].[Movement]
	CHECK CONSTRAINT [FK_Fact_Movement_Date_Key_Dimension_Date]

GO
ALTER TABLE [Fact].[Movement]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Movement_Stock_Item_Key_Dimension_Stock Item]
	FOREIGN KEY ([Stock Item Key]) REFERENCES [Dimension].[Stock Item] ([Stock Item Key])
ALTER TABLE [Fact].[Movement]
	CHECK CONSTRAINT [FK_Fact_Movement_Stock_Item_Key_Dimension_Stock Item]

GO
ALTER TABLE [Fact].[Movement]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Movement_Customer_Key_Dimension_Customer]
	FOREIGN KEY ([Customer Key]) REFERENCES [Dimension].[Customer] ([Customer Key])
ALTER TABLE [Fact].[Movement]
	CHECK CONSTRAINT [FK_Fact_Movement_Customer_Key_Dimension_Customer]

GO
ALTER TABLE [Fact].[Movement]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Movement_Supplier_Key_Dimension_Supplier]
	FOREIGN KEY ([Supplier Key]) REFERENCES [Dimension].[Supplier] ([Supplier Key])
ALTER TABLE [Fact].[Movement]
	CHECK CONSTRAINT [FK_Fact_Movement_Supplier_Key_Dimension_Supplier]

GO
ALTER TABLE [Fact].[Movement]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Movement_Transaction_Type_Key_Dimension_Transaction Type]
	FOREIGN KEY ([Transaction Type Key]) REFERENCES [Dimension].[Transaction Type] ([Transaction Type Key])
ALTER TABLE [Fact].[Movement]
	CHECK CONSTRAINT [FK_Fact_Movement_Transaction_Type_Key_Dimension_Transaction Type]

GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCX_Fact_Movement]
	ON [Fact].[Movement]
	ON [PS_Date] ([Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Movement_Customer_Key]
	ON [Fact].[Movement] ([Customer Key])
	ON [PS_Date] ([Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Movement_Date_Key]
	ON [Fact].[Movement] ([Date Key])
	ON [PS_Date] ([Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Movement_Stock_Item_Key]
	ON [Fact].[Movement] ([Stock Item Key])
	ON [PS_Date] ([Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Movement_Supplier_Key]
	ON [Fact].[Movement] ([Supplier Key])
	ON [PS_Date] ([Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Movement_Transaction_Type_Key]
	ON [Fact].[Movement] ([Transaction Type Key])
	ON [PS_Date] ([Date Key])
GO
CREATE NONCLUSTERED INDEX [IX_Integration_Movement_WWI_Stock_Item_Transaction_ID]
	ON [Fact].[Movement] ([WWI Stock Item Transaction ID])
	ON [PS_Date] ([Date Key])
GO
EXEC sp_addextendedproperty N'Description', N'Movement fact table (movements of stock items)', 'SCHEMA', N'Fact', 'TABLE', N'Movement', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'DW key for a row in the Movement fact', 'SCHEMA', N'Fact', 'TABLE', N'Movement', 'COLUMN', N'Movement Key'
GO
EXEC sp_addextendedproperty N'Description', N'Transaction date', 'SCHEMA', N'Fact', 'TABLE', N'Movement', 'COLUMN', N'Date Key'
GO
EXEC sp_addextendedproperty N'Description', N'Stock item for this purchase order', 'SCHEMA', N'Fact', 'TABLE', N'Movement', 'COLUMN', N'Stock Item Key'
GO
EXEC sp_addextendedproperty N'Description', N'Customer (if applicable)', 'SCHEMA', N'Fact', 'TABLE', N'Movement', 'COLUMN', N'Customer Key'
GO
EXEC sp_addextendedproperty N'Description', N'Supplier (if applicable)', 'SCHEMA', N'Fact', 'TABLE', N'Movement', 'COLUMN', N'Supplier Key'
GO
EXEC sp_addextendedproperty N'Description', N'Type of transaction', 'SCHEMA', N'Fact', 'TABLE', N'Movement', 'COLUMN', N'Transaction Type Key'
GO
EXEC sp_addextendedproperty N'Description', N'Stock item transaction ID in source system', 'SCHEMA', N'Fact', 'TABLE', N'Movement', 'COLUMN', N'WWI Stock Item Transaction ID'
GO
EXEC sp_addextendedproperty N'Description', N'Invoice ID in source system', 'SCHEMA', N'Fact', 'TABLE', N'Movement', 'COLUMN', N'WWI Invoice ID'
GO
EXEC sp_addextendedproperty N'Description', N'Purchase order ID in source system', 'SCHEMA', N'Fact', 'TABLE', N'Movement', 'COLUMN', N'WWI Purchase Order ID'
GO
EXEC sp_addextendedproperty N'Description', N'Quantity of stock movement (positive is incoming stock, negative is outgoing)', 'SCHEMA', N'Fact', 'TABLE', N'Movement', 'COLUMN', N'Quantity'
GO
EXEC sp_addextendedproperty N'Description', N'Lineage Key for the data load for this row', 'SCHEMA', N'Fact', 'TABLE', N'Movement', 'COLUMN', N'Lineage Key'
GO
ALTER TABLE [Fact].[Movement] SET (LOCK_ESCALATION = TABLE)
GO
