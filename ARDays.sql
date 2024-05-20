
/* The below View create AR Days for the Manufacturing Industry. Using CTE's two unrelated data sets were Connected to using Month YEAR columns. 
The data was put into aggregate table to reduce the transactional data down into reportable data and Remove PPI.  */

CREATE VIEW AccountReceivableDays AS

-- Sales Section
WITH SalesLayer1 AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY Year([Sale Date]), Month([Sale Date])) AS [Transaction ID],
        Month([Sale Date]) AS [Month],
        Year([Sale Date]) AS [Year],
        DATENAME(Month, [Sale Date]) AS [Month Name],
        SUM([Revenue]) as [Revenue],
        [Product Category]
    FROM
        [Sales Table]
    WHERE
        [Sale Date] >= DATEADD(Month, -20, GETDATE())
        AND [Product Category] = 'Category1'
    GROUP BY 
        Year([Sale Date]),
        Month([Sale Date]),
        DATENAME(Month, [Sale Date]),
        [Product Category]
),
SalesLayer2 AS (
    SELECT 
        [Transaction ID],
        [Year],
        [Month],
        [Month Name],
        [Product Category],
        [Revenue]
    FROM
        SalesLayer1
),
SalesLayer3 AS (
    SELECT 
        [Transaction ID],
        [Year],
        [Month],
        [Month Name],
        [Product Category],
        CAST(SUM([Revenue]) AS DECIMAL(10, 2)) AS [Revenue],
        CAST(SUM([Revenue]) OVER (PARTITION BY [Product Category] ORDER BY [Transaction ID] ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS DECIMAL(10, 2)) AS [90 Day Rolling],
        CAST((SUM([Revenue]) OVER (PARTITION BY [Product Category] ORDER BY [Transaction ID] ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)/90) AS DECIMAL(10, 2)) AS [90 Day AVG Daily Revenue]
    FROM 
        SalesLayer2
    GROUP BY 
        [Transaction ID],
        [Year],
        [Month],
        [Month Name],
        [Product Category],
        [Revenue]
),

-- AR Section
ARLayer1 AS (
    SELECT 
        [AR Date],
        DATEADD(Month, -1, [AR Date]) as [AR Dates],
        SUM(Balance) AS Balance,
        ROW_NUMBER() OVER (PARTITION BY Month([AR Date]), Year([AR Date]) ORDER BY [AR Date]) AS RowNum
    FROM  
        AR_Data
    WHERE [AR Date] IS NOT NULL
    GROUP BY [AR Date]
),
ARLayer2 AS (
    SELECT 
        [AR Date],
        [AR Dates],
        Month([AR Dates]) AS [Month],
        Year([AR Dates]) AS [Year],
        SUM(Balance) AS Balance,
        ROW_NUMBER() OVER (PARTITION BY Month([AR Date]), Year([AR Date]) ORDER BY [AR Date]) AS RowNum
    FROM  
        ARLayer1
    GROUP BY [AR Dates], [AR Date]
),
ARLayer3 AS (
    SELECT 
        [AR Date],
        [AR Dates], 
        [Month], 
        [Year], 
        Balance
    FROM 
        ARLayer2
    WHERE RowNum = 1
),
ARLayer4 AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY [Year], [Month]) AS [Transaction ID],
        [Month],
        [Year],
        DATENAME(Month, DATEFROMPARTS([Year], [Month], 1)) AS [Month Name], 
        SUM([Balance]) AS [Balance]
    FROM
        ARLayer3    
    WHERE
        [AR Date] >= DATEADD(Month, -24, GETDATE())
    GROUP BY 
        [Year],
        [Month]
),
ARLayer5 AS (
    SELECT 
        [Transaction ID],
        [Year],
        [Month],
        [Month Name],
        CAST(SUM([Balance]) AS DECIMAL(10, 2)) AS [AR Balance]
    FROM 
        ARLayer4
    GROUP BY 
        [Transaction ID],
        [Year],
        [Month],
        [Month Name]
)

-- Connect the AR to the Sales Data
SELECT 
    s.[Transaction ID],
    s.[Year],
    s.[Month],
    s.[Month Name],
    s.[90 Day AVG Daily Revenue],
    a.[AR Balance],
    a.[AR Balance] / s.[90 Day AVG Daily Revenue] AS [AccountReceivableDays]
FROM 
    ARLayer5 a
INNER JOIN
    SalesLayer3 s
ON 
    a.[Year] = s.[Year] AND
    a.[Month] = s.[Month]
GO

