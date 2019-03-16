SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Integration].[Supplier_Staging] (
		[Supplier Staging Key]     [int] IDENTITY(1, 1) NOT NULL,
		[WWI Supplier ID]          [int] NOT NULL,
		[Supplier]                 [nvarchar](100) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Category]                 [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Primary Contact]          [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Supplier Reference]       [nvarchar](20) COLLATE Latin1_General_100_CI_AS NULL,
		[Payment Days]             [int] NOT NULL,
		[Postal Code]              [nvarchar](10) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Valid From]               [datetime2](7) NOT NULL,
		[Valid To]                 [datetime2](7) NOT NULL,
		CONSTRAINT [PK_Integration_Supplier_Staging]
		PRIMARY KEY
		NONCLUSTERED
		([Supplier Staging Key])
)
WITH (MEMORY_OPTIMIZED=ON, DURABILITY=SCHEMA_ONLY)
GO
