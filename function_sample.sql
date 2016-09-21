IF object_id(N'SimpleFunctionPlus', N'FN') IS NOT NULL
	DROP FUNCTION SimpleFunctionPlus
GO

CREATE FUNCTION SimpleFunctionPlus
(
	@param1 int,
	@param2 int
)
RETURNS INT
AS
BEGIN
    RETURN @param1 + @param2
END;
GO

select 1, dbo.SimpleFunctionPlus (2,31);
go
