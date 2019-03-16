SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Dimension].[City] (
		[City Key]                       [int] NOT NULL,
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
		[Lineage Key]                    [int] NOT NULL,
		CONSTRAINT [PK_Dimension_City]
		PRIMARY KEY
		CLUSTERED
		([City Key])
	ON [USERDATA]
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
GO
ALTER TABLE [Dimension].[City]
	ADD
	CONSTRAINT [DF_Dimension_City_City_Key]
	DEFAULT (NEXT VALUE FOR [Sequences].[CityKey]) FOR [City Key]
GO
CREATE NONCLUSTERED INDEX [IX_Dimension_City_WWICityID]
	ON [Dimension].[City] ([WWI City ID], [Valid From], [Valid To])
	ON [USERDATA]
GO
EXEC sp_addextendedproperty N'Description', N'Allows quickly locating by WWI ID', 'SCHEMA', N'Dimension', 'TABLE', N'City', 'INDEX', N'IX_Dimension_City_WWICityID'
GO
EXEC sp_addextendedproperty N'Description', N'City dimension', 'SCHEMA', N'Dimension', 'TABLE', N'City', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'DW key for the city dimension', 'SCHEMA', N'Dimension', 'TABLE', N'City', 'COLUMN', N'City Key'
GO
EXEC sp_addextendedproperty N'Description', N'Numeric ID used for reference to a city within the WWI database', 'SCHEMA', N'Dimension', 'TABLE', N'City', 'COLUMN', N'WWI City ID'
GO
EXEC sp_addextendedproperty N'Description', N'Formal name of the city', 'SCHEMA', N'Dimension', 'TABLE', N'City', 'COLUMN', N'City'
GO
EXEC sp_addextendedproperty N'Description', N'State or province for this city', 'SCHEMA', N'Dimension', 'TABLE', N'City', 'COLUMN', N'State Province'
GO
EXEC sp_addextendedproperty N'Description', N'Country name', 'SCHEMA', N'Dimension', 'TABLE', N'City', 'COLUMN', N'Country'
GO
EXEC sp_addextendedproperty N'Description', N'Continent that this city is on', 'SCHEMA', N'Dimension', 'TABLE', N'City', 'COLUMN', N'Continent'
GO
EXEC sp_addextendedproperty N'Description', N'Sales territory for this StateProvince', 'SCHEMA', N'Dimension', 'TABLE', N'City', 'COLUMN', N'Sales Territory'
GO
EXEC sp_addextendedproperty N'Description', N'Name of the region', 'SCHEMA', N'Dimension', 'TABLE', N'City', 'COLUMN', N'Region'
GO
EXEC sp_addextendedproperty N'Description', N'Name of the subregion', 'SCHEMA', N'Dimension', 'TABLE', N'City', 'COLUMN', N'Subregion'
GO
EXEC sp_addextendedproperty N'Description', N'Geographic location of the city', 'SCHEMA', N'Dimension', 'TABLE', N'City', 'COLUMN', N'Location'
GO
EXEC sp_addextendedproperty N'Description', N'Latest available population for the City', 'SCHEMA', N'Dimension', 'TABLE', N'City', 'COLUMN', N'Latest Recorded Population'
GO
EXEC sp_addextendedproperty N'Description', N'Valid from this date and time', 'SCHEMA', N'Dimension', 'TABLE', N'City', 'COLUMN', N'Valid From'
GO
EXEC sp_addextendedproperty N'Description', N'Valid until this date and time', 'SCHEMA', N'Dimension', 'TABLE', N'City', 'COLUMN', N'Valid To'
GO
EXEC sp_addextendedproperty N'Description', N'Lineage Key for the data load for this row', 'SCHEMA', N'Dimension', 'TABLE', N'City', 'COLUMN', N'Lineage Key'
GO
ALTER TABLE [Dimension].[City] SET (LOCK_ESCALATION = TABLE)
GO
