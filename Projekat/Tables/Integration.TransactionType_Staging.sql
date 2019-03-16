SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Integration].[TransactionType_Staging] (
		[Transaction Type Staging Key]     [int] IDENTITY(1, 1) NOT NULL,
		[WWI Transaction Type ID]          [int] NOT NULL,
		[Transaction Type]                 [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Valid From]                       [datetime2](7) NOT NULL,
		[Valid To]                         [datetime2](7) NOT NULL,
		CONSTRAINT [PK_Integration_Transaction_Type_Staging]
		PRIMARY KEY
		NONCLUSTERED
		([Transaction Type Staging Key])
)
WITH (MEMORY_OPTIMIZED=ON, DURABILITY=SCHEMA_ONLY)
GO
