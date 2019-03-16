SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Integration].[City_Staging] (
		[City Staging Key]               [int] IDENTITY(1, 1) NOT NULL,
		[WWI City ID]                    [int] NOT NULL,
		[City]                           [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[State Province]                 [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Country]                        [nvarchar](60) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Continent]                      [nvarchar](30) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Sales Territory]                [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Region]                         [nvarchar](30) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Subregion]                      [nvarchar](30) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Location]                       [geography] NULL,
		[Latest Recorded Population]     [bigint] NOT NULL,
		[Valid From]                     [datetime2](7) NOT NULL,
		[Valid To]                       [datetime2](7) NOT NULL,
		CONSTRAINT [PK_Integration_City_Staging]
		PRIMARY KEY
		CLUSTERED
		([City Staging Key])
	ON [USERDATA]
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
GO
CREATE NONCLUSTERED INDEX [IX_Integration_City_Staging_WWI_City_ID]
	ON [Integration].[City_Staging] ([WWI City ID])
	ON [USERDATA]
GO
EXEC sp_addextendedproperty N'Description', N'Allows quickly locating by WWI City Key', 'SCHEMA', N'Integration', 'TABLE', N'City_Staging', 'INDEX', N'IX_Integration_City_Staging_WWI_City_ID'
GO
EXEC sp_addextendedproperty N'Description', N'City staging table', 'SCHEMA', N'Integration', 'TABLE', N'City_Staging', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'Row ID within the staging table', 'SCHEMA', N'Integration', 'TABLE', N'City_Staging', 'COLUMN', N'City Staging Key'
GO
EXEC sp_addextendedproperty N'Description', N'Numeric ID used for reference to a city within the WWI database', 'SCHEMA', N'Integration', 'TABLE', N'City_Staging', 'COLUMN', N'WWI City ID'
GO
EXEC sp_addextendedproperty N'Description', N'Formal name of the city', 'SCHEMA', N'Integration', 'TABLE', N'City_Staging', 'COLUMN', N'City'
GO
EXEC sp_addextendedproperty N'Description', N'State or province for this city', 'SCHEMA', N'Integration', 'TABLE', N'City_Staging', 'COLUMN', N'State Province'
GO
EXEC sp_addextendedproperty N'Description', N'Country name', 'SCHEMA', N'Integration', 'TABLE', N'City_Staging', 'COLUMN', N'Country'
GO
EXEC sp_addextendedproperty N'Description', N'Continent that this city is on', 'SCHEMA', N'Integration', 'TABLE', N'City_Staging', 'COLUMN', N'Continent'
GO
EXEC sp_addextendedproperty N'Description', N'Sales territory for this StateProvince', 'SCHEMA', N'Integration', 'TABLE', N'City_Staging', 'COLUMN', N'Sales Territory'
GO
EXEC sp_addextendedproperty N'Description', N'Name of the region', 'SCHEMA', N'Integration', 'TABLE', N'City_Staging', 'COLUMN', N'Region'
GO
EXEC sp_addextendedproperty N'Description', N'Name of the subregion', 'SCHEMA', N'Integration', 'TABLE', N'City_Staging', 'COLUMN', N'Subregion'
GO
EXEC sp_addextendedproperty N'Description', N'Geographic location of the city', 'SCHEMA', N'Integration', 'TABLE', N'City_Staging', 'COLUMN', N'Location'
GO
EXEC sp_addextendedproperty N'Description', N'Latest available population for the City', 'SCHEMA', N'Integration', 'TABLE', N'City_Staging', 'COLUMN', N'Latest Recorded Population'
GO
EXEC sp_addextendedproperty N'Description', N'Valid from this date and time', 'SCHEMA', N'Integration', 'TABLE', N'City_Staging', 'COLUMN', N'Valid From'
GO
EXEC sp_addextendedproperty N'Description', N'Valid until this date and time', 'SCHEMA', N'Integration', 'TABLE', N'City_Staging', 'COLUMN', N'Valid To'
GO
ALTER TABLE [Integration].[City_Staging] SET (LOCK_ESCALATION = TABLE)
GO
