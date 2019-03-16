SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Integration].[PaymentMethod_Staging] (
		[Payment Method Staging Key]     [int] IDENTITY(1, 1) NOT NULL,
		[WWI Payment Method ID]          [int] NOT NULL,
		[Payment Method]                 [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Valid From]                     [datetime2](7) NOT NULL,
		[Valid To]                       [datetime2](7) NOT NULL,
		CONSTRAINT [PK_Integration_Payment_Method_Staging]
		PRIMARY KEY
		NONCLUSTERED
		([Payment Method Staging Key])
)
WITH (MEMORY_OPTIMIZED=ON, DURABILITY=SCHEMA_ONLY)
GO
