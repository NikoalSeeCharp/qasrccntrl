SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Integration].[Customer_Staging] (
		[Customer Staging Key]     [int] IDENTITY(1, 1) NOT NULL,
		[WWI Customer ID]          [int] NOT NULL,
		[Customer]                 [nvarchar](100) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Bill To Customer]         [nvarchar](100) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Category]                 [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Buying Group]             [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Primary Contact]          [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Postal Code]              [nvarchar](10) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Valid From]               [datetime2](7) NOT NULL,
		[Valid To]                 [datetime2](7) NOT NULL,
		CONSTRAINT [PK_Integration_Customer_Staging]
		PRIMARY KEY
		NONCLUSTERED
		([Customer Staging Key])
)
WITH (MEMORY_OPTIMIZED=ON, DURABILITY=SCHEMA_ONLY)
GO
