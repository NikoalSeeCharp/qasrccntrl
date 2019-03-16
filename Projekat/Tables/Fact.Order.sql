SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Fact].[Order] (
		[Order Key]               [bigint] IDENTITY(1, 1) NOT NULL,
		[City Key]                [int] NOT NULL,
		[Customer Key]            [int] NOT NULL,
		[Stock Item Key]          [int] NOT NULL,
		[Order Date Key]          [date] NOT NULL,
		[Picked Date Key]         [date] NULL,
		[Salesperson Key]         [int] NOT NULL,
		[Picker Key]              [int] NULL,
		[WWI Order ID]            [int] NOT NULL,
		[WWI Backorder ID]        [int] NULL,
		[Description]             [nvarchar](100) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Package]                 [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Quantity]                [int] NOT NULL,
		[Unit Price]              [decimal](18, 2) NOT NULL,
		[Tax Rate]                [decimal](18, 3) NOT NULL,
		[Total Excluding Tax]     [decimal](18, 2) NOT NULL,
		[Tax Amount]              [decimal](18, 2) NOT NULL,
		[Total Including Tax]     [decimal](18, 2) NOT NULL,
		[Lineage Key]             [int] NOT NULL,
		CONSTRAINT [PK_Fact_Order]
		PRIMARY KEY
		NONCLUSTERED
		([Order Key], [Order Date Key])
	ON [PS_Date] ([Order Date Key])
) ON [PS_Date] ([Order Date Key])
GO
ALTER TABLE [Fact].[Order]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Order_City_Key_Dimension_City]
	FOREIGN KEY ([City Key]) REFERENCES [Dimension].[City] ([City Key])
ALTER TABLE [Fact].[Order]
	CHECK CONSTRAINT [FK_Fact_Order_City_Key_Dimension_City]

GO
ALTER TABLE [Fact].[Order]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Order_Customer_Key_Dimension_Customer]
	FOREIGN KEY ([Customer Key]) REFERENCES [Dimension].[Customer] ([Customer Key])
ALTER TABLE [Fact].[Order]
	CHECK CONSTRAINT [FK_Fact_Order_Customer_Key_Dimension_Customer]

GO
ALTER TABLE [Fact].[Order]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Order_Stock_Item_Key_Dimension_Stock Item]
	FOREIGN KEY ([Stock Item Key]) REFERENCES [Dimension].[Stock Item] ([Stock Item Key])
ALTER TABLE [Fact].[Order]
	CHECK CONSTRAINT [FK_Fact_Order_Stock_Item_Key_Dimension_Stock Item]

GO
ALTER TABLE [Fact].[Order]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Order_Order_Date_Key_Dimension_Date]
	FOREIGN KEY ([Order Date Key]) REFERENCES [Dimension].[Date] ([Date])
ALTER TABLE [Fact].[Order]
	CHECK CONSTRAINT [FK_Fact_Order_Order_Date_Key_Dimension_Date]

GO
ALTER TABLE [Fact].[Order]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Order_Picked_Date_Key_Dimension_Date]
	FOREIGN KEY ([Picked Date Key]) REFERENCES [Dimension].[Date] ([Date])
ALTER TABLE [Fact].[Order]
	CHECK CONSTRAINT [FK_Fact_Order_Picked_Date_Key_Dimension_Date]

GO
ALTER TABLE [Fact].[Order]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Order_Salesperson_Key_Dimension_Employee]
	FOREIGN KEY ([Salesperson Key]) REFERENCES [Dimension].[Employee] ([Employee Key])
ALTER TABLE [Fact].[Order]
	CHECK CONSTRAINT [FK_Fact_Order_Salesperson_Key_Dimension_Employee]

GO
ALTER TABLE [Fact].[Order]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Order_Picker_Key_Dimension_Employee]
	FOREIGN KEY ([Picker Key]) REFERENCES [Dimension].[Employee] ([Employee Key])
ALTER TABLE [Fact].[Order]
	CHECK CONSTRAINT [FK_Fact_Order_Picker_Key_Dimension_Employee]

GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCX_Fact_Order]
	ON [Fact].[Order]
	ON [PS_Date] ([Order Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Order_City_Key]
	ON [Fact].[Order] ([City Key])
	ON [PS_Date] ([Order Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Order_Customer_Key]
	ON [Fact].[Order] ([Customer Key])
	ON [PS_Date] ([Order Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Order_Order_Date_Key]
	ON [Fact].[Order] ([Order Date Key])
	ON [PS_Date] ([Order Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Order_Picked_Date_Key]
	ON [Fact].[Order] ([Picked Date Key])
	ON [PS_Date] ([Order Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Order_Picker_Key]
	ON [Fact].[Order] ([Picker Key])
	ON [PS_Date] ([Order Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Order_Salesperson_Key]
	ON [Fact].[Order] ([Salesperson Key])
	ON [PS_Date] ([Order Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Order_Stock_Item_Key]
	ON [Fact].[Order] ([Stock Item Key])
	ON [PS_Date] ([Order Date Key])
GO
CREATE NONCLUSTERED INDEX [IX_Integration_Order_WWI_Order_ID]
	ON [Fact].[Order] ([WWI Order ID])
	ON [PS_Date] ([Order Date Key])
GO
EXEC sp_addextendedproperty N'Description', N'Order fact table (customer orders)', 'SCHEMA', N'Fact', 'TABLE', N'Order', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'DW key for a row in the Order fact', 'SCHEMA', N'Fact', 'TABLE', N'Order', 'COLUMN', N'Order Key'
GO
EXEC sp_addextendedproperty N'Description', N'City for this order', 'SCHEMA', N'Fact', 'TABLE', N'Order', 'COLUMN', N'City Key'
GO
EXEC sp_addextendedproperty N'Description', N'Customer for this order', 'SCHEMA', N'Fact', 'TABLE', N'Order', 'COLUMN', N'Customer Key'
GO
EXEC sp_addextendedproperty N'Description', N'Stock item for this order', 'SCHEMA', N'Fact', 'TABLE', N'Order', 'COLUMN', N'Stock Item Key'
GO
EXEC sp_addextendedproperty N'Description', N'Order date for this order', 'SCHEMA', N'Fact', 'TABLE', N'Order', 'COLUMN', N'Order Date Key'
GO
EXEC sp_addextendedproperty N'Description', N'Picked date for this order', 'SCHEMA', N'Fact', 'TABLE', N'Order', 'COLUMN', N'Picked Date Key'
GO
EXEC sp_addextendedproperty N'Description', N'Salesperson for this order', 'SCHEMA', N'Fact', 'TABLE', N'Order', 'COLUMN', N'Salesperson Key'
GO
EXEC sp_addextendedproperty N'Description', N'Picker for this order', 'SCHEMA', N'Fact', 'TABLE', N'Order', 'COLUMN', N'Picker Key'
GO
EXEC sp_addextendedproperty N'Description', N'OrderID in source system', 'SCHEMA', N'Fact', 'TABLE', N'Order', 'COLUMN', N'WWI Order ID'
GO
EXEC sp_addextendedproperty N'Description', N'BackorderID in source system', 'SCHEMA', N'Fact', 'TABLE', N'Order', 'COLUMN', N'WWI Backorder ID'
GO
EXEC sp_addextendedproperty N'Description', N'Description of the item supplied (Usually the stock item name but can be overridden)', 'SCHEMA', N'Fact', 'TABLE', N'Order', 'COLUMN', N'Description'
GO
EXEC sp_addextendedproperty N'Description', N'Type of package to be supplied', 'SCHEMA', N'Fact', 'TABLE', N'Order', 'COLUMN', N'Package'
GO
EXEC sp_addextendedproperty N'Description', N'Quantity to be supplied', 'SCHEMA', N'Fact', 'TABLE', N'Order', 'COLUMN', N'Quantity'
GO
EXEC sp_addextendedproperty N'Description', N'Unit price to be charged', 'SCHEMA', N'Fact', 'TABLE', N'Order', 'COLUMN', N'Unit Price'
GO
EXEC sp_addextendedproperty N'Description', N'Tax rate to be applied', 'SCHEMA', N'Fact', 'TABLE', N'Order', 'COLUMN', N'Tax Rate'
GO
EXEC sp_addextendedproperty N'Description', N'Total amount excluding tax', 'SCHEMA', N'Fact', 'TABLE', N'Order', 'COLUMN', N'Total Excluding Tax'
GO
EXEC sp_addextendedproperty N'Description', N'Total amount of tax', 'SCHEMA', N'Fact', 'TABLE', N'Order', 'COLUMN', N'Tax Amount'
GO
EXEC sp_addextendedproperty N'Description', N'Total amount including tax', 'SCHEMA', N'Fact', 'TABLE', N'Order', 'COLUMN', N'Total Including Tax'
GO
EXEC sp_addextendedproperty N'Description', N'Lineage Key for the data load for this row', 'SCHEMA', N'Fact', 'TABLE', N'Order', 'COLUMN', N'Lineage Key'
GO
ALTER TABLE [Fact].[Order] SET (LOCK_ESCALATION = TABLE)
GO
