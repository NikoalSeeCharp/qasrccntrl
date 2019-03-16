SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Integration].[ETL Cutoff] (
		[Table Name]      [sysname] COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Cutoff Time]     [datetime2](7) NOT NULL,
		CONSTRAINT [PK_Integration_ETL_Cutoff]
		PRIMARY KEY
		CLUSTERED
		([Table Name])
	ON [USERDATA]
) ON [USERDATA]
GO
EXEC sp_addextendedproperty N'Description', N'ETL Cutoff Times', 'SCHEMA', N'Integration', 'TABLE', N'ETL Cutoff', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'Table name', 'SCHEMA', N'Integration', 'TABLE', N'ETL Cutoff', 'COLUMN', N'Table Name'
GO
EXEC sp_addextendedproperty N'Description', N'Time up to which data has been loaded', 'SCHEMA', N'Integration', 'TABLE', N'ETL Cutoff', 'COLUMN', N'Cutoff Time'
GO
ALTER TABLE [Integration].[ETL Cutoff] SET (LOCK_ESCALATION = TABLE)
GO
