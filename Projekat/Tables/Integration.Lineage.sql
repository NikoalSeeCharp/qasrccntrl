SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Integration].[Lineage] (
		[Lineage Key]                   [int] NOT NULL,
		[Data Load Started]             [datetime2](7) NOT NULL,
		[Table Name]                    [sysname] COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Data Load Completed]           [datetime2](7) NULL,
		[Was Successful]                [bit] NOT NULL,
		[Source System Cutoff Time]     [datetime2](7) NOT NULL,
		CONSTRAINT [PK_Integration_Lineage]
		PRIMARY KEY
		CLUSTERED
		([Lineage Key])
	ON [USERDATA]
) ON [USERDATA]
GO
ALTER TABLE [Integration].[Lineage]
	ADD
	CONSTRAINT [DF_Integration_Lineage_Lineage_Key]
	DEFAULT (NEXT VALUE FOR [Sequences].[LineageKey]) FOR [Lineage Key]
GO
EXEC sp_addextendedproperty N'Description', N'Details of data load attempts', 'SCHEMA', N'Integration', 'TABLE', N'Lineage', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'DW key for lineage data', 'SCHEMA', N'Integration', 'TABLE', N'Lineage', 'COLUMN', N'Lineage Key'
GO
EXEC sp_addextendedproperty N'Description', N'Time when the data load attempt began', 'SCHEMA', N'Integration', 'TABLE', N'Lineage', 'COLUMN', N'Data Load Started'
GO
EXEC sp_addextendedproperty N'Description', N'Name of the table for this data load event', 'SCHEMA', N'Integration', 'TABLE', N'Lineage', 'COLUMN', N'Table Name'
GO
EXEC sp_addextendedproperty N'Description', N'Time when the data load attempt completed (successfully or not)', 'SCHEMA', N'Integration', 'TABLE', N'Lineage', 'COLUMN', N'Data Load Completed'
GO
EXEC sp_addextendedproperty N'Description', N'Was the attempt successful?', 'SCHEMA', N'Integration', 'TABLE', N'Lineage', 'COLUMN', N'Was Successful'
GO
EXEC sp_addextendedproperty N'Description', N'Time that rows from the source system were loaded up until', 'SCHEMA', N'Integration', 'TABLE', N'Lineage', 'COLUMN', N'Source System Cutoff Time'
GO
ALTER TABLE [Integration].[Lineage] SET (LOCK_ESCALATION = TABLE)
GO
