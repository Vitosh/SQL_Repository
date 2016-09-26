--Some of the code is taken from:
--https://technet.microsoft.com/en-us/library/ms175939(v=sql.90).aspx

USE [TSQL2012]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_Cube](
	[myid] [int] IDENTITY(1,1) NOT NULL,
	[item] [nvarchar](20) NOT NULL,
	[color] [nvarchar](10) NOT NULL,
	[quantity] [int] NOT NULL
)
GO
truncate table tbl_cube
INSERT INTO tbl_Cube (item, Color, quantity) VALUES ('Table','Blue',124)
INSERT INTO tbl_Cube (item, Color, quantity) VALUES ('Table','Red',223)
INSERT INTO tbl_Cube (item, Color, quantity) VALUES ('Chair','Blue',101)
INSERT INTO tbl_Cube (item, Color, quantity) VALUES ('Chair','Red',210)

select * from tbl_Cube

select item, color, sum(quantity) [QtySum] from tbl_Cube
group by Item, color with Cube

select case when (grouping(item) = 1) then 'ALL1'
		else ISNULL(item,'Unknown')
	end as item,
	case when(grouping(color) = 1) then 'ALL2'
		else ISNULL(Color, 'Unknown')
	end as color,
	sum(quantity) as QtySum
from tbl_Cube
group by Item, color with cube

SELECT CASE WHEN (GROUPING(Item) = 1) THEN 'ALL'
            ELSE ISNULL(Item, 'UNKNOWN')
       END AS Item,
       SUM(Quantity) AS QtySum
FROM tbl_Cube
GROUP BY Item WITH CUBE
GO

CREATE VIEW InvCube AS
SELECT CASE WHEN (GROUPING(Item) = 1) THEN 'ALL'
            ELSE ISNULL(Item, 'UNKNOWN')
       END AS Item,
       CASE WHEN (GROUPING(Color) = 1) THEN 'ALL'
            ELSE ISNULL(Color, 'UNKNOWN')
       END AS Color,
       SUM(Quantity) AS QtySum
FROM tbl_Cube
GROUP BY Item, Color WITH CUBE
GO

select * from InvCube

-- Different number of rows returned (7 and 9): 
SELECT CASE WHEN (GROUPING(Item) = 1) THEN 'ALL'
            ELSE ISNULL(Item, 'UNKNOWN')
       END AS Item,
       CASE WHEN (GROUPING(Color) = 1) THEN 'ALL'
            ELSE ISNULL(Color, 'UNKNOWN')
       END AS Color,
       SUM(Quantity) AS QtySum
FROM tbl_cube
GROUP BY Item, Color WITH ROLLUP
ORDER BY QtySum

SELECT CASE WHEN (GROUPING(Item) = 1) THEN 'ALL'
            ELSE ISNULL(Item, 'UNKNOWN')
       END AS Item,
       CASE WHEN (GROUPING(Color) = 1) THEN 'ALL'
            ELSE ISNULL(Color, 'UNKNOWN')
       END AS Color,
       SUM(Quantity) AS QtySum
FROM tbl_cube 
GROUP BY Item, Color WITH CUBE
ORDER BY QtySum
