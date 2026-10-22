USE [AirbnbPrices];
GO

-- ====================== Amsterdam =============================
-- 1 Nulls 
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[AmsterdamWeekdays];

--
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[AmsterdamWeekends];

--2 Casting
SELECT * 
FROM [BRONZE].[AmsterdamWeekdays] 
WHERE TRY_CAST([realSum] AS DECIMAL) IS NULL; 

SELECT * 
FROM [BRONZE].[AmsterdamWeekdays] 
WHERE TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * 
FROM [BRONZE].[AmsterdamWeekdays] 
WHERE TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * 
FROM [BRONZE].[AmsterdamWeekdays] 
WHERE TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * 
FROM [BRONZE].[AmsterdamWeekdays] 
WHERE TRY_CAST([bedrooms] AS INT) IS NULL;

SELECT * 
FROM [BRONZE].[AmsterdamWeekdays] 
WHERE TRY_CAST([dist] AS DECIMAL) IS NULL;

SELECT * 
FROM [BRONZE].[AmsterdamWeekdays] 
WHERE TRY_CAST([metro_dist] AS DECIMAL) IS NULL;

SELECT *
FROM [BRONZE].[AmsterdamWeekdays] 
WHERE TRY_CAST([attr_index] AS DECIMAL) IS NULL;

SELECT * 
FROM [BRONZE].[AmsterdamWeekdays] 
WHERE TRY_CAST([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * 
FROM [BRONZE].[AmsterdamWeekdays] 
WHERE TRY_CAST([rest_index] AS DECIMAL) IS NULL;

SELECT * 
FROM [BRONZE].[AmsterdamWeekdays] 
WHERE TRY_CAST([rest_index_norm] AS DECIMAL) IS NULL;

SELECT *
FROM [BRONZE].[AmsterdamWeekdays] 
WHERE TRY_CAST([lng] AS DECIMAL) IS NULL;

SELECT *
FROM [BRONZE].[AmsterdamWeekdays] 
WHERE TRY_CAST([lng] AS DECIMAL) IS NULL;

--
SELECT * 
FROM [BRONZE].[AmsterdamWeekends] 
WHERE TRY_CAST([realSum] AS DECIMAL) IS NULL; 

SELECT * 
FROM [BRONZE].[AmsterdamWeekends] 
WHERE TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * 
FROM [BRONZE].[AmsterdamWeekends] 
WHERE TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * 
FROM [BRONZE].[AmsterdamWeekends] 
WHERE TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * 
FROM [BRONZE].[AmsterdamWeekends] 
WHERE TRY_CAST([bedrooms] AS INT) IS NULL;

SELECT * 
FROM [BRONZE].[AmsterdamWeekends] 
WHERE TRY_CAST([dist] AS DECIMAL) IS NULL;

SELECT * 
FROM [BRONZE].[AmsterdamWeekends] 
WHERE TRY_CAST([metro_dist] AS DECIMAL) IS NULL;

SELECT *
FROM [BRONZE].[AmsterdamWeekends] 
WHERE TRY_CAST([attr_index] AS DECIMAL) IS NULL;

SELECT * 
FROM [BRONZE].[AmsterdamWeekends] 
WHERE TRY_CAST([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * 
FROM [BRONZE].[AmsterdamWeekends] 
WHERE TRY_CAST([rest_index] AS DECIMAL) IS NULL;

SELECT * 
FROM [BRONZE].[AmsterdamWeekends] 
WHERE TRY_CAST([rest_index_norm] AS DECIMAL) IS NULL;

SELECT *
FROM [BRONZE].[AmsterdamWeekends] 
WHERE TRY_CAST([lng] AS DECIMAL) IS NULL;

SELECT *
FROM [BRONZE].[AmsterdamWeekends] 
WHERE TRY_CAST([lng] AS DECIMAL) IS NULL;

-- 3 Categorical 
SELECT  [room_type], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekdays]
GROUP BY [room_type];

SELECT  [room_shared], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekdays]
GROUP BY [room_shared];

SELECT  room_private, COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekdays]
GROUP BY room_private;

SELECT  [host_is_superhost], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekdays]
GROUP BY [host_is_superhost];

SELECT  [multi], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekdays]
GROUP BY [multi];

SELECT  [biz], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekdays]
GROUP BY [biz];

--
SELECT  [room_type], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekends]
GROUP BY [room_type];

SELECT  [room_shared], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekends]
GROUP BY [room_shared];

SELECT  room_private, COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekends]
GROUP BY room_private;

SELECT  [host_is_superhost], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekends]
GROUP BY [host_is_superhost];

SELECT  [multi], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekends]
GROUP BY [multi];

SELECT  [biz], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekends]
GROUP BY [biz];

-- Amsterdam is enough; 
-- any other countries would just be extra work for no reason.
