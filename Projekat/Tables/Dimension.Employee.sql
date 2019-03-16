SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Dimension].[Employee] (
		[Employee Key]        [int] NOT NULL,
		[WWI Employee ID]     [int] NOT NULL,
		[Employee]            [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Preferred Name]      [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Is Salesperson]      [bit] NOT NULL,
		[Photo]               [varbinary](max) NULL,
		[Valid From]          [datetime2](7) NOT NULL,
		[Valid To]            [datetime2](7) NOT NULL,
		[Lineage Key]         [int] NOT NULL,
		CONSTRAINT [PK_Dimension_Employee]
		PRIMARY KEY
		CLUSTERED
		([Employee Key])
	ON [USERDATA]
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
GO
ALTER TABLE [Dimension].[Employee]
	ADD
	CONSTRAINT [DF_Dimension_Employee_Employee_Key]
	DEFAULT (NEXT VALUE FOR [Sequences].[EmployeeKey]) FOR [Employee Key]
GO
CREATE NONCLUSTERED INDEX [IX_Dimension_Employee_WWIEmployeeID]
	ON [Dimension].[Employee] ([WWI Employee ID], [Valid From], [Valid To])
	ON [USERDATA]
GO
EXEC sp_addextendedproperty N'Description', N'Allows quickly locating by WWI ID', 'SCHEMA', N'Dimension', 'TABLE', N'Employee', 'INDEX', N'IX_Dimension_Employee_WWIEmployeeID'
GO
EXEC sp_addextendedproperty N'Description', N'Employee dimension', 'SCHEMA', N'Dimension', 'TABLE', N'Employee', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'DW key for the employee dimension', 'SCHEMA', N'Dimension', 'TABLE', N'Employee', 'COLUMN', N'Employee Key'
GO
EXEC sp_addextendedproperty N'Description', N'Numeric ID (PersonID) in the WWI database', 'SCHEMA', N'Dimension', 'TABLE', N'Employee', 'COLUMN', N'WWI Employee ID'
GO
EXEC sp_addextendedproperty N'Description', N'Full name for this person', 'SCHEMA', N'Dimension', 'TABLE', N'Employee', 'COLUMN', N'Employee'
GO
EXEC sp_addextendedproperty N'Description', N'Name that this person prefers to be called', 'SCHEMA', N'Dimension', 'TABLE', N'Employee', 'COLUMN', N'Preferred Name'
GO
EXEC sp_addextendedproperty N'Description', N'Is this person a staff salesperson?', 'SCHEMA', N'Dimension', 'TABLE', N'Employee', 'COLUMN', N'Is Salesperson'
GO
EXEC sp_addextendedproperty N'Description', N'Photo of this person', 'SCHEMA', N'Dimension', 'TABLE', N'Employee', 'COLUMN', N'Photo'
GO
EXEC sp_addextendedproperty N'Description', N'Valid from this date and time', 'SCHEMA', N'Dimension', 'TABLE', N'Employee', 'COLUMN', N'Valid From'
GO
EXEC sp_addextendedproperty N'Description', N'Valid until this date and time', 'SCHEMA', N'Dimension', 'TABLE', N'Employee', 'COLUMN', N'Valid To'
GO
EXEC sp_addextendedproperty N'Description', N'Lineage Key for the data load for this row', 'SCHEMA', N'Dimension', 'TABLE', N'Employee', 'COLUMN', N'Lineage Key'
GO
ALTER TABLE [Dimension].[Employee] SET (LOCK_ESCALATION = TABLE)
GO
