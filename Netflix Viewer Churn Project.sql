/* Netflix Data Project */
/* https://www.kaggle.com/datasets/rahulvyasm/netflix-movies-and-tv-shows */


/* USE CASE:
	A Executive at Netflix is running a team doing analysis to better understand viewer churn within a streming session.
	They have found that the duration of movies and number of episodes in a single season is positively correlated with 
	session churn to a statistically significant level.
	
	This executive Now wants to do an over haul of all of the release date data to better understand where and when 
	longer duration movies and high volume series are relased. The executive wanted to better understand of duration 
	break down by seasonal, holiday, genre and rating by the Year and Month level. To better understand trends in 
	when longer duration movies and high volume series are release to netflix in hope to understand what possesed 
	the company to believe this was the right choice.
*/


-- Keeping integrety of the raw data while cleaning it for further analysis and creating new fields via a view. --

CREATE VIEW [NF Viewing Churn] AS
SELECT 
    *,
    CASE
        WHEN listed_in LIKE '%Documentaries%' THEN 'Documentaries'
        WHEN listed_in LIKE '%Action & Adventure%' THEN 'Action & Adventure'
        WHEN listed_in LIKE '%Anime Series%' OR listed_in LIKE '%Anime Features%' THEN 'Anime'
        WHEN listed_in LIKE '%British TV Shows%' THEN 'British TV'
        WHEN listed_in LIKE '%Children & Family Movies%' OR listed_in LIKE '%Kids'' TV%' THEN 'Children & Family'
        WHEN listed_in LIKE '%Classic Movies%' OR listed_in LIKE '%Classic & Cult TV%' THEN 'Classics'
        WHEN listed_in LIKE '%Comedies%' THEN 'Comedies'
        WHEN listed_in LIKE '%Crime TV Shows%' THEN 'Crime'
        WHEN listed_in LIKE '%Cult Movies%' THEN 'Cult'
        WHEN listed_in LIKE '%Dramas%' THEN 'Dramas'
        WHEN listed_in LIKE '%Faith & Spirituality%' THEN 'Faith & Spirituality'
        WHEN listed_in LIKE '%Horror Movies%' OR listed_in LIKE '%TV Horror%' THEN 'Horror'
        WHEN listed_in LIKE '%Independent Movies%' THEN 'Independent'
        WHEN listed_in LIKE '%International Movies%' OR listed_in LIKE '%International TV Shows%' THEN 'International'
        WHEN listed_in LIKE '%Korean TV Shows%' THEN 'Korean TV'
        WHEN listed_in LIKE '%LGBTQ Movies%' THEN 'LGBTQ'
        WHEN listed_in LIKE '%Music & Musicals%' THEN 'Music & Musicals'
        WHEN listed_in LIKE '%Reality TV%' THEN 'Reality TV'
        WHEN listed_in LIKE '%Romantic Movies%' OR listed_in LIKE '%Romantic TV Shows%' THEN 'Romance'
        WHEN listed_in LIKE '%Sci-Fi & Fantasy%' OR listed_in LIKE '%TV Sci-Fi & Fantasy%' THEN 'Sci-Fi & Fantasy'
        WHEN listed_in LIKE '%Sports Movies%' THEN 'Sports'
        WHEN listed_in LIKE '%Stand-Up Comedy & Talk Shows%' THEN 'Stand-Up & Talk Shows'
        WHEN listed_in LIKE '%Teen TV Shows%' THEN 'Teen TV'
        WHEN listed_in LIKE '%Thrillers%' OR listed_in LIKE '%TV Thrillers%' THEN 'Thrillers'
        WHEN listed_in LIKE '%TV Comedies%' THEN 'TV Comedies'
        WHEN listed_in LIKE '%TV Dramas%' THEN 'TV Dramas'
        WHEN listed_in LIKE '%TV Action & Adventure%' THEN 'TV Action & Adventure'
        WHEN listed_in LIKE '%TV Mysteries%' THEN 'TV Mysteries'
        ELSE 'Other'
    END AS Genre,
    CAST(SUBSTRING(Duration, 1, CHARINDEX(' ', Duration) - 1) AS INT) AS [Duration Value],
    SUBSTRING(Duration, CHARINDEX(' ', Duration) + 1, LEN(Duration) - CHARINDEX(' ', Duration)) AS [Duration Type],
    DATEPART(MONTH, date_added) AS [Month Added],
    DATEPART(DAY, date_added) AS [Day Added],
    DATENAME(WEEKDAY, date_added) AS [Day of Week Added],
    DATENAME(MONTH, date_added) AS [MonthAdded Name],
    CASE 
        WHEN DATEPART(MONTH, date_added) IN (12, 1, 2) THEN 'Winter'
        WHEN DATEPART(MONTH, date_added) IN (3, 4, 5) THEN 'Spring'
        WHEN DATEPART(MONTH, date_added) IN (6, 7, 8) THEN 'Summer'
        ELSE 'Fall' 
    END AS Season,
    CASE 
        WHEN MONTH(date_added) = 2 AND DAY(date_added) = 14 THEN 'Valentine''s Day'
        WHEN MONTH(date_added) = 7 AND DAY(date_added) = 4 THEN 'Fourth of July'
        WHEN MONTH(date_added) = 3 AND DAY(date_added) = 17 THEN 'St. Patrick''s Day'
        WHEN MONTH(date_added) = 12 AND DAY(date_added) = 25 THEN 'Christmas'
        WHEN MONTH(date_added) = 11 AND DATENAME(WEEKDAY, date_added) = 'Thursday' AND DAY(date_added) >= 22 AND DAY(date_added) <= 28 THEN 'Thanksgiving'
        WHEN MONTH(date_added) = 10 AND DAY(date_added) = 31 THEN 'Halloween'
        ELSE '' 
    END AS [Months Holiday],
    DATEPART(YEAR, date_added) AS [Year Added],
    DATEPART(YEAR, date_added) - release_year AS [Release to Added (yrs)]
FROM NetflixData;



/* 
Below are CTEs used to break things down from a seasonal, holiday, genre and rating perspective for both tv shows and movies.
The second layer of the CTE's can be used for further analysis in SQL, turned into low demand connections in a Power BI or 
Tableau dashboard or report.

Note: When working as a Data Analyst there is often work that is requested but not used. In the data cleaning section not all of
the fields created are utilized in the CTEs below. 
*/


WITH GenreDurations AS (
    SELECT
		YEAR(date_added) as YEAR,
		DATENAME(mm,date_added) as MONTH,
        FORMAT(date_added, 'MM-yyyy') AS MonthYear,
        [Genre],
        AVG([Duration Value]) AS [MOVIE AVG Duration by Genre (MINS)]
    --FROM [NF Viewing Churn]
	FROM [dbo].[NetflixData]
    WHERE [Duration Type] = 'min'
    GROUP BY YEAR(date_added),DATENAME(mm,date_added), FORMAT(date_added, 'MM-yyyy'), [Genre]
)
, GENRE_MOVIE AS (
    SELECT * FROM GenreDurations
)
----TV Genres CTE---
, TV_GenreDurations AS (
    SELECT
		YEAR(date_added) as YEAR,
		DATENAME(mm,date_added) as MONTH,
        FORMAT(date_added, 'MM-yyyy') AS MonthYear,
        [Genre],
        AVG([Duration Value]) AS [TV AVG Duration by Genre (SEASONS)]
    FROM [NF Viewing Churn]
    WHERE [Duration Type] = 'Seasons'
    GROUP BY FORMAT(date_added, 'MM-yyyy'), [Genre]
)
, GENRE_TV AS (
    SELECT * FROM TV_GenreDurations
    WHERE MonthYear IS NOT NULL
)

--- Moving Rating CTE ---
, RatingDurations AS (
    SELECT
		YEAR(date_added) as YEAR,
		DATENAME(mm,date_added) as MONTH,
        FORMAT(date_added, 'MM-yyyy') AS MonthYear,
        [rating],
        AVG([Duration Value]) AS [MOVIE AVG Duration by Genre (MINS)]
    FROM [NF Viewing Churn]
    WHERE [Duration Type] = 'min'
    GROUP BY FORMAT(date_added, 'MM-yyyy'), [rating]
)
, Rating_MOVIE AS (
    SELECT * FROM RatingDurations
	 WHERE MonthYear IS NOT NULL
)

--- TV Rating CTE ---
, TV_ratingDurations AS (
    SELECT
		YEAR(date_added) as YEAR,
		DATENAME(mm,date_added) as MONTH,
        FORMAT(date_added, 'MM-yyyy') AS MonthYear,
        [rating],
        AVG([Duration Value]) AS [TV AVG Duration by rating (SEASONS)]
    FROM [NF Viewing Churn]
    WHERE [Duration Type] = 'Seasons'
    GROUP BY FORMAT(date_added, 'MM-yyyy'), [rating]
)
, rating_TV AS (
    SELECT * FROM TV_ratingDurations
    WHERE MonthYear IS NOT NULL
)
--- Movie and Release Season ---
,SeasonDurations AS (
    SELECT
		YEAR(date_added) as YEAR,
		DATENAME(mm,date_added) as MONTH,
        FORMAT(date_added, 'MM-yyyy') AS MonthYear,
        [Season],
        AVG([Duration Value]) AS [MOVIE AVG Duration by Season (MINS)]
    FROM [NF Viewing Churn]
    WHERE [Duration Type] = 'min'
    GROUP BY FORMAT(date_added, 'MM-yyyy'), [Season]
)
, Season_MOVIE AS (
    SELECT * FROM SeasonDurations
	 WHERE MonthYear IS NOT NULL
)

--- TV and Season Release ---
, TV_SeasonDurations AS (
    SELECT
		YEAR(date_added) as YEAR,
		DATENAME(mm,date_added) as MONTH,
        FORMAT(date_added, 'MM-yyyy') AS MonthYear,
        [Season],
        AVG([Duration Value]) AS [TV AVG Duration by Season (SEASONS)]
    FROM [NF Viewing Churn]
    WHERE [Duration Type] = 'Seasons'
    GROUP BY FORMAT(date_added, 'MM-yyyy'), [Season]
)
, TV_SEASONS AS (
    SELECT * FROM TV_SeasonDurations
    WHERE MonthYear IS NOT NULL
)

--- Movies and Holidays ---
, MonthsHolidayDurations AS (
    SELECT
		YEAR(date_added) as YEAR,
		DATENAME(mm,date_added) as MONTH,
        FORMAT(date_added, 'MM-yyyy') AS MonthYear,
        [Months Holiday],
        AVG([Duration Value]) AS [MOVIE AVG Duration by Months Holiday (MINS)]
    FROM [NF Viewing Churn]
    WHERE [Duration Type] = 'min'
    GROUP BY FORMAT(date_added, 'MM-yyyy'), [Months Holiday]
)
, MH_MOVIE AS (
    SELECT * FROM MonthsHolidayDurations
	 WHERE MonthYear IS NOT NULL
)

--- TV and Holidays ---
, TV_MonthsHolidayDurations AS (
    SELECT
		YEAR(date_added) as YEAR,
		DATENAME(mm,date_added) as MONTH,
        FORMAT(date_added, 'MM-yyyy') AS MonthYear,
        [Months Holiday],
        AVG([Duration Value]) AS [TV AVG Duration by Months Holiday (SEASONS)]
    FROM [NF Viewing Churn]
    WHERE [Duration Type] = 'Seasons'
    GROUP BY FORMAT(date_added, 'MM-yyyy'), [Months Holiday]
)
, MH_SEASONS AS (
    SELECT * FROM TV_MonthsHolidayDurations
    WHERE MonthYear IS NOT NULL
)

/* 
Query Space to pull data from a CTE. ex: 
*/
		SELECT * FROM MH_SEASONS
		WHERE MONTH = 'December'