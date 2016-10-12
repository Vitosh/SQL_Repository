use PIV
GO
EXEC sp_rename '[dbo].[Versions].[Versions.MyDate]', 'MyDate', 'COLUMN';
go

alter table Versions
add constraint uc_VersionNumber UNIQUE (VersionNumber)
