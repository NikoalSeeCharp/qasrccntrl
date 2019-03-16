SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Fact].[Purchase] (
		[Purchase Key]              [bigint] IDENTITY(1, 1) NOT NULL,
		[Date Key]                  [date] NOT NULL,
		[Supplier Key]              [int] NOT NULL,
		[Stock Item Key]            [int] NOT NULL,
		[WWI Purchase Order ID]     [int] NULL,
		[Ordered Outers]            [int] NOT NULL,
		[Ordered Quantity]          [int] NOT NULL,
		[Received Outers]           [int] NOT NULL,
		[Package]                   [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Is Order Finalized]        [bit] NOT NULL,
		[Lineage Key]               [int] NOT NULL,
		CONSTRAINT [PK_Fact_Purchase]
		PRIMARY KEY
		NONCLUSTERED
		([Purchase Key], [Date Key])
	ON [PS_Date] ([Date Key])
) ON [PS_Date] ([Date Key])
GO
ALTER TABLE [Fact].[Purchase]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Purchase_Date_Key_Dimension_Date]
	FOREIGN KEY ([Date Key]) REFERENCES [Dimension].[Date] ([Date])
ALTER TABLE [Fact].[Purchase]
	CHECK CONSTRAINT [FK_Fact_Purchase_Date_Key_Dimension_Date]

GO
ALTER TABLE [Fact].[Purchase]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Purchase_Supplier_Key_Dimension_Supplier]
	FOREIGN KEY ([Supplier Key]) REFERENCES [Dimension].[Supplier] ([Supplier Key])
ALTER TABLE [Fact].[Purchase]
	CHECK CONSTRAINT [FK_Fact_Purchase_Supplier_Key_Dimension_Supplier]

GO
ALTER TABLE [Fact].[Purchase]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Purchase_Stock_Item_Key_Dimension_Stock Item]
	FOREIGN KEY ([Stock Item Key]) REFERENCES [Dimension].[Stock Item] ([Stock Item Key])
ALTER TABLE [Fact].[Purchase]
	CHECK CONSTRAINT [FK_Fact_Purchase_Stock_Item_Key_Dimension_Stock Item]

GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCX_Fact_Purchase]
	ON [Fact].[Purchase]
	ON [PS_Date] ([Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Purchase_Date_Key]
	ON [Fact].[Purchase] ([Date Key])
	ON [PS_Date] ([Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Purchase_Stock_Item_Key]
	ON [Fact].[Purchase] ([Stock Item Key])
	ON [PS_Date] ([Date Key])
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Purchase_Supplier_Key]
	ON [Fact].[Purchase] ([Supplier Key])
	ON [PS_Date] ([Date Key])
GO
EXEC sp_addextendedproperty N'Description', N'Purchase fact table (stock purchases from suppliers)', 'SCHEMA', N'Fact', 'TABLE', N'Purchase', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'DW key for a row in the Purchase fact', 'SCHEMA', N'Fact', 'TABLE', N'Purchase', 'COLUMN', N'Purchase Key'
GO
EXEC sp_addextendedproperty N'Description', N'Purchase order date', 'SCHEMA', N'Fact', 'TABLE', N'Purchase', 'COLUMN', N'Date Key'
GO
EXEC sp_addextendedproperty N'Description', N'Supplier for this purchase order', 'SCHEMA', N'Fact', 'TABLE', N'Purchase', 'COLUMN', N'Supplier Key'
GO
EXEC sp_addextendedproperty N'Description', N'Stock item for this purchase order', 'SCHEMA', N'Fact', 'TABLE', N'Purchase', 'COLUMN', N'Stock Item Key'
GO
EXEC sp_addextendedproperty N'Description', N'Purchase order ID in source system ', 'SCHEMA', N'Fact', 'TABLE', N'Purchase', 'COLUMN', N'WWI Purchase Order ID'
GO
EXEC sp_addextendedproperty N'Description', N'Quantity of outers (ordering packages)', 'SCHEMA', N'Fact', 'TABLE', N'Purchase', 'COLUMN', N'Ordered Outers'
GO
EXEC sp_addextendedproperty N'Description', N'Quantity of inners (selling packages)', 'SCHEMA', N'Fact', 'TABLE', N'Purchase', 'COLUMN', N'Ordered Quantity'
GO
EXEC sp_addextendedproperty N'Description', N'Received outers (so far)', 'SCHEMA', N'Fact', 'TABLE', N'Purchase', 'COLUMN', N'Received Outers'
GO
EXEC sp_addextendedproperty N'Description', N'Package ordered', 'SCHEMA', N'Fact', 'TABLE', N'Purchase', 'COLUMN', N'Package'
GO
EXEC sp_addextendedproperty N'Description', N'Is this purchase order now finalized?', 'SCHEMA', N'Fact', 'TABLE', N'Purchase', 'COLUMN', N'Is Order Finalized'
GO
EXEC sp_addextendedproperty N'Description', N'Lineage Key for the data load for this row', 'SCHEMA', N'Fact', 'TABLE', N'Purchase', 'COLUMN', N'Lineage Key'
GO
ALTER TABLE [Fact].[Purchase] SET (LOCK_ESCALATION = TABLE)
GO
