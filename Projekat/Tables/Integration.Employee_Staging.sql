SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Integration].[Employee_Staging] (
		[Employee Staging Key]     [int] IDENTITY(1, 1) NOT NULL,
		[WWI Employee ID]          [int] NOT NULL,
		[Employee]                 [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Preferred Name]           [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Is Salesperson]           [bit] NOT NULL,
		[Photo]                    [varbinary](max) NULL,
		[Valid From]               [datetime2](7) NOT NULL,
		[Valid To]                 [datetime2](7) NOT NULL,
		CONSTRAINT [PK_Integration_Employee_Staging]
		PRIMARY KEY
		NONCLUSTERED
		([Employee Staging Key])
)
WITH (MEMORY_OPTIMIZED=ON, DURABILITY=SCHEMA_ONLY)
GO
