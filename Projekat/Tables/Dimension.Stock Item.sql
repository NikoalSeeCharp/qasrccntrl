SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Dimension].[Stock Item] (
		[Stock Item Key]               [int] NOT NULL,
		[WWI Stock Item ID]            [int] NOT NULL,
		[Stock Item]                   [nvarchar](100) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Color]                        [nvarchar](20) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Selling Package]              [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Buying Package]               [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Brand]                        [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Size]                         [nvarchar](20) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Lead Time Days]               [int] NOT NULL,
		[Quantity Per Outer]           [int] NOT NULL,
		[Is Chiller Stock]             [bit] NOT NULL,
		[Barcode]                      [nvarchar](50) COLLATE Latin1_General_100_CI_AS NULL,
		[Tax Rate]                     [decimal](18, 3) NOT NULL,
		[Unit Price]                   [decimal](18, 2) NOT NULL,
		[Recommended Retail Price]     [decimal](18, 2) NULL,
		[Typical Weight Per Unit]      [decimal](18, 3) NOT NULL,
		[Photo]                        [varbinary](max) NULL,
		[Valid From]                   [datetime2](7) NOT NULL,
		[Valid To]                     [datetime2](7) NOT NULL,
		[Lineage Key]                  [int] NOT NULL,
		CONSTRAINT [PK_Dimension_Stock_Item]
		PRIMARY KEY
		CLUSTERED
		([Stock Item Key])
	ON [USERDATA]
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
GO
ALTER TABLE [Dimension].[Stock Item]
	ADD
	CONSTRAINT [DF_Dimension_Stock_Item_Stock_Item_Key]
	DEFAULT (NEXT VALUE FOR [Sequences].[StockItemKey]) FOR [Stock Item Key]
GO
CREATE NONCLUSTERED INDEX [IX_Dimension_Stock_Item_WWIStockItemID]
	ON [Dimension].[Stock Item] ([WWI Stock Item ID], [Valid From], [Valid To])
	ON [USERDATA]
GO
EXEC sp_addextendedproperty N'Description', N'Allows quickly locating by WWI ID', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'INDEX', N'IX_Dimension_Stock_Item_WWIStockItemID'
GO
EXEC sp_addextendedproperty N'Description', N'StockItem dimension', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'DW key for the stock item dimension', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'COLUMN', N'Stock Item Key'
GO
EXEC sp_addextendedproperty N'Description', N'Numeric ID used for reference to a stock item within the WWI database', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'COLUMN', N'WWI Stock Item ID'
GO
EXEC sp_addextendedproperty N'Description', N'Full name of a stock item (but not a full description)', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'COLUMN', N'Stock Item'
GO
EXEC sp_addextendedproperty N'Description', N'Color (optional) for this stock item', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'COLUMN', N'Color'
GO
EXEC sp_addextendedproperty N'Description', N'Usual package for selling units of this stock item', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'COLUMN', N'Selling Package'
GO
EXEC sp_addextendedproperty N'Description', N'Usual package for selling outers of this stock item (ie cartons, boxes, etc.)', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'COLUMN', N'Buying Package'
GO
EXEC sp_addextendedproperty N'Description', N'Brand for the stock item (if the item is branded)', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'Description', N'Size of this item (eg: 100mm)', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'COLUMN', N'Size'
GO
EXEC sp_addextendedproperty N'Description', N'Number of days typically taken from order to receipt of this stock item', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'COLUMN', N'Lead Time Days'
GO
EXEC sp_addextendedproperty N'Description', N'Quantity of the stock item in an outer package', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'COLUMN', N'Quantity Per Outer'
GO
EXEC sp_addextendedproperty N'Description', N'Does this stock item need to be in a chiller?', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'COLUMN', N'Is Chiller Stock'
GO
EXEC sp_addextendedproperty N'Description', N'Barcode for this stock item', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'COLUMN', N'Barcode'
GO
EXEC sp_addextendedproperty N'Description', N'Tax rate to be applied', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'COLUMN', N'Tax Rate'
GO
EXEC sp_addextendedproperty N'Description', N'Selling price (ex-tax) for one unit of this product', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'COLUMN', N'Unit Price'
GO
EXEC sp_addextendedproperty N'Description', N'Recommended retail price for this stock item', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'COLUMN', N'Recommended Retail Price'
GO
EXEC sp_addextendedproperty N'Description', N'Typical weight for one unit of this product (packaged)', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'COLUMN', N'Typical Weight Per Unit'
GO
EXEC sp_addextendedproperty N'Description', N'Photo of the product', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'COLUMN', N'Photo'
GO
EXEC sp_addextendedproperty N'Description', N'Valid from this date and time', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'COLUMN', N'Valid From'
GO
EXEC sp_addextendedproperty N'Description', N'Valid until this date and time', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'COLUMN', N'Valid To'
GO
EXEC sp_addextendedproperty N'Description', N'Lineage Key for the data load for this row', 'SCHEMA', N'Dimension', 'TABLE', N'Stock Item', 'COLUMN', N'Lineage Key'
GO
ALTER TABLE [Dimension].[Stock Item] SET (LOCK_ESCALATION = TABLE)
GO
