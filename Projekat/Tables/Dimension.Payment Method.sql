SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Dimension].[Payment Method] (
		[Payment Method Key]        [int] NOT NULL,
		[WWI Payment Method ID]     [int] NOT NULL,
		[Payment Method]            [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Valid From]                [datetime2](7) NOT NULL,
		[Valid To]                  [datetime2](7) NOT NULL,
		[Lineage Key]               [int] NOT NULL,
		CONSTRAINT [PK_Dimension_Payment_Method]
		PRIMARY KEY
		CLUSTERED
		([Payment Method Key])
	ON [USERDATA]
) ON [USERDATA]
GO
ALTER TABLE [Dimension].[Payment Method]
	ADD
	CONSTRAINT [DF_Dimension_Payment_Method_Payment_Method_Key]
	DEFAULT (NEXT VALUE FOR [Sequences].[PaymentMethodKey]) FOR [Payment Method Key]
GO
CREATE NONCLUSTERED INDEX [IX_Dimension_Payment_Method_WWIPaymentMethodID]
	ON [Dimension].[Payment Method] ([WWI Payment Method ID], [Valid From], [Valid To])
	ON [USERDATA]
GO
EXEC sp_addextendedproperty N'Description', N'Allows quickly locating by WWI ID', 'SCHEMA', N'Dimension', 'TABLE', N'Payment Method', 'INDEX', N'IX_Dimension_Payment_Method_WWIPaymentMethodID'
GO
EXEC sp_addextendedproperty N'Description', N'PaymentMethod dimension', 'SCHEMA', N'Dimension', 'TABLE', N'Payment Method', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'DW key for the payment method dimension', 'SCHEMA', N'Dimension', 'TABLE', N'Payment Method', 'COLUMN', N'Payment Method Key'
GO
EXEC sp_addextendedproperty N'Description', N'Numeric ID for the payment method in the WWI database', 'SCHEMA', N'Dimension', 'TABLE', N'Payment Method', 'COLUMN', N'WWI Payment Method ID'
GO
EXEC sp_addextendedproperty N'Description', N'Payment method name', 'SCHEMA', N'Dimension', 'TABLE', N'Payment Method', 'COLUMN', N'Payment Method'
GO
EXEC sp_addextendedproperty N'Description', N'Valid from this date and time', 'SCHEMA', N'Dimension', 'TABLE', N'Payment Method', 'COLUMN', N'Valid From'
GO
EXEC sp_addextendedproperty N'Description', N'Valid until this date and time', 'SCHEMA', N'Dimension', 'TABLE', N'Payment Method', 'COLUMN', N'Valid To'
GO
EXEC sp_addextendedproperty N'Description', N'Lineage Key for the data load for this row', 'SCHEMA', N'Dimension', 'TABLE', N'Payment Method', 'COLUMN', N'Lineage Key'
GO
ALTER TABLE [Dimension].[Payment Method] SET (LOCK_ESCALATION = TABLE)
GO
