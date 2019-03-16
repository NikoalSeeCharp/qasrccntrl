SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Dimension].[Date] (
		[Date]                      [date] NOT NULL,
		[Day Number]                [int] NOT NULL,
		[Day]                       [nvarchar](10) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Month]                     [nvarchar](10) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Short Month]               [nvarchar](3) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Calendar Month Number]     [int] NOT NULL,
		[Calendar Month Label]      [nvarchar](20) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Calendar Year]             [int] NOT NULL,
		[Calendar Year Label]       [nvarchar](10) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Fiscal Month Number]       [int] NOT NULL,
		[Fiscal Month Label]        [nvarchar](20) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Fiscal Year]               [int] NOT NULL,
		[Fiscal Year Label]         [nvarchar](10) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[ISO Week Number]           [int] NOT NULL,
		CONSTRAINT [PK_Dimension_Date]
		PRIMARY KEY
		CLUSTERED
		([Date])
	ON [USERDATA]
) ON [USERDATA]
GO
EXEC sp_addextendedproperty N'Description', N'Date dimension', 'SCHEMA', N'Dimension', 'TABLE', N'Date', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'DW key for date dimension (actual date is used for key)', 'SCHEMA', N'Dimension', 'TABLE', N'Date', 'COLUMN', N'Date'
GO
EXEC sp_addextendedproperty N'Description', N'Day of the month', 'SCHEMA', N'Dimension', 'TABLE', N'Date', 'COLUMN', N'Day Number'
GO
EXEC sp_addextendedproperty N'Description', N'Day name', 'SCHEMA', N'Dimension', 'TABLE', N'Date', 'COLUMN', N'Day'
GO
EXEC sp_addextendedproperty N'Description', N'Month name (ie September)', 'SCHEMA', N'Dimension', 'TABLE', N'Date', 'COLUMN', N'Month'
GO
EXEC sp_addextendedproperty N'Description', N'Short month name (ie Sep)', 'SCHEMA', N'Dimension', 'TABLE', N'Date', 'COLUMN', N'Short Month'
GO
EXEC sp_addextendedproperty N'Description', N'Calendar month number', 'SCHEMA', N'Dimension', 'TABLE', N'Date', 'COLUMN', N'Calendar Month Number'
GO
EXEC sp_addextendedproperty N'Description', N'Calendar month label (ie CY2015Jun)', 'SCHEMA', N'Dimension', 'TABLE', N'Date', 'COLUMN', N'Calendar Month Label'
GO
EXEC sp_addextendedproperty N'Description', N'Calendar year (ie 2015)', 'SCHEMA', N'Dimension', 'TABLE', N'Date', 'COLUMN', N'Calendar Year'
GO
EXEC sp_addextendedproperty N'Description', N'Calendar year label (ie CY2015)', 'SCHEMA', N'Dimension', 'TABLE', N'Date', 'COLUMN', N'Calendar Year Label'
GO
EXEC sp_addextendedproperty N'Description', N'Fiscal month number', 'SCHEMA', N'Dimension', 'TABLE', N'Date', 'COLUMN', N'Fiscal Month Number'
GO
EXEC sp_addextendedproperty N'Description', N'Fiscal month label (ie FY2015Feb)', 'SCHEMA', N'Dimension', 'TABLE', N'Date', 'COLUMN', N'Fiscal Month Label'
GO
EXEC sp_addextendedproperty N'Description', N'Fiscal year (ie 2016)', 'SCHEMA', N'Dimension', 'TABLE', N'Date', 'COLUMN', N'Fiscal Year'
GO
EXEC sp_addextendedproperty N'Description', N'Fiscal year label (ie FY2015)', 'SCHEMA', N'Dimension', 'TABLE', N'Date', 'COLUMN', N'Fiscal Year Label'
GO
EXEC sp_addextendedproperty N'Description', N'ISO week number (ie 25)', 'SCHEMA', N'Dimension', 'TABLE', N'Date', 'COLUMN', N'ISO Week Number'
GO
ALTER TABLE [Dimension].[Date] SET (LOCK_ESCALATION = TABLE)
GO
