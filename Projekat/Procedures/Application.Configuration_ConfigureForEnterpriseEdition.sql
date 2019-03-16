SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Application].Configuration_ConfigureForEnterpriseEdition
AS
BEGIN

    EXEC [Application].Configuration_ApplyPartitionedColumnstoreIndexing;

    EXEC [Application].Configuration_EnableInMemory;

	EXEC [Application].Configuration_ApplyPolybase;

END;
GO
