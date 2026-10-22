CREATE SCHEMA SILVER;
GO

USE [AirbnbPrices];
GO

-- 1 [SILVER].[AmsterdamWeekdays]
SELECT 
	TRY_CAST([Column 0] AS INT) AS listing_id,
	TRY_CAST([realSum] AS DECIMAL(8,2)) AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '') AS [room_type],
	CASE
        WHEN LTRIM(RTRIM(room_shared)) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM(room_shared)) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS room_shared,
	CASE
        WHEN LTRIM(RTRIM([room_private])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([room_private])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [room_private],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) AS [person_capacity],
	CASE
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [host_is_superhost],
	TRY_CAST([multi] AS BIT) AS multi,
	TRY_CAST([biz] AS BIT) AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT) AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(8,3)) AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(8,3)) AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(8,3)) AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(8,3)) AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(8,3)) AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(8,3)) AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4)) AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4)) AS [lat]
INTO [SILVER].[AmsterdamWeekdays]
FROM [BRONZE].[AmsterdamWeekdays];

ALTER TABLE [SILVER].[AmsterdamWeekdays] ALTER COLUMN [listing_id] INT NOT NULL;

ALTER TABLE [SILVER].[AmsterdamWeekdays] ADD CONSTRAINT PK_SILVER_AmsterdamWeekdays 
PRIMARY KEY([listing_id]);



-- 2 [SILVER].[AmsterdamWeekends]
SELECT 
	TRY_CAST([Column 0] AS INT) AS listing_id,
	TRY_CAST([realSum] AS DECIMAL(8,2)) AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '') AS [room_type],
	CASE
        WHEN LTRIM(RTRIM(room_shared)) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM(room_shared)) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS room_shared,
	CASE
        WHEN LTRIM(RTRIM([room_private])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([room_private])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [room_private],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) AS [person_capacity],
	CASE
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [host_is_superhost],
	TRY_CAST([multi] AS BIT) AS multi,
	TRY_CAST([biz] AS BIT) AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT) AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(8,3)) AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(8,3)) AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(8,3)) AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(8,3)) AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(8,3)) AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(8,3)) AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4)) AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4)) AS [lat]
INTO [SILVER].[AmsterdamWeekends]
FROM [BRONZE].[AmsterdamWeekends];

ALTER TABLE [SILVER].[AmsterdamWeekends] ALTER COLUMN [listing_id] INT NOT NULL;

ALTER TABLE [SILVER].[AmsterdamWeekends] ADD CONSTRAINT PK_SILVER_AmsterdamWeekends 
PRIMARY KEY([listing_id]);


-- 3 [SILVER].[AthensWeekdays]
SELECT 
	TRY_CAST([Column 0] AS INT) AS listing_id,
	TRY_CAST([realSum] AS DECIMAL(8,2)) AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '') AS [room_type],
	CASE
        WHEN LTRIM(RTRIM(room_shared)) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM(room_shared)) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS room_shared,
	CASE
        WHEN LTRIM(RTRIM([room_private])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([room_private])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [room_private],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) AS [person_capacity],
	CASE
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [host_is_superhost],
	TRY_CAST([multi] AS BIT) AS multi,
	TRY_CAST([biz] AS BIT) AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT) AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(8,3)) AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(8,3)) AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(8,3)) AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(8,3)) AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(8,3)) AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(8,3)) AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4)) AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4)) AS [lat]
INTO [SILVER].[AthensWeekdays]
FROM [BRONZE].[AthensWeekdays];

ALTER TABLE [SILVER].[AthensWeekdays] ALTER COLUMN [listing_id] INT NOT NULL;

ALTER TABLE [SILVER].[AthensWeekdays] ADD CONSTRAINT PK_SILVER_AthensWeekdays 
PRIMARY KEY([listing_id]);


-- 4 [SILVER].[AthensWeekends]
SELECT 
	TRY_CAST([Column 0] AS INT) AS listing_id,
	TRY_CAST([realSum] AS DECIMAL(8,2)) AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '') AS [room_type],
	CASE
        WHEN LTRIM(RTRIM(room_shared)) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM(room_shared)) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS room_shared,
	CASE
        WHEN LTRIM(RTRIM([room_private])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([room_private])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [room_private],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) AS [person_capacity],
	CASE
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [host_is_superhost],
	TRY_CAST([multi] AS BIT) AS multi,
	TRY_CAST([biz] AS BIT) AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT) AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(8,3)) AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(8,3)) AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(8,3)) AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(8,3)) AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(8,3)) AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(8,3)) AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4)) AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4)) AS [lat]
INTO [SILVER].[AthensWeekends]
FROM [BRONZE].[AthensWeekends];

ALTER TABLE [SILVER].[AthensWeekends] ALTER COLUMN [listing_id] INT NOT NULL;

ALTER TABLE [SILVER].[AthensWeekends] ADD CONSTRAINT PK_SILVER_AthensWeekends 
PRIMARY KEY([listing_id]);


-- 5 [SILVER].[BarcelonaWeekdays]
SELECT 
	TRY_CAST([Column 0] AS INT) AS listing_id,
	TRY_CAST([realSum] AS DECIMAL(8,2)) AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '') AS [room_type],
	CASE
        WHEN LTRIM(RTRIM(room_shared)) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM(room_shared)) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS room_shared,
	CASE
        WHEN LTRIM(RTRIM([room_private])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([room_private])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [room_private],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) AS [person_capacity],
	CASE
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [host_is_superhost],
	TRY_CAST([multi] AS BIT) AS multi,
	TRY_CAST([biz] AS BIT) AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT) AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(8,3)) AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(8,3)) AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(8,3)) AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(8,3)) AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(8,3)) AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(8,3)) AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4)) AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4)) AS [lat]
INTO [SILVER].[BarcelonaWeekdays]
FROM [BRONZE].[BarcelonaWeekdays];

ALTER TABLE [SILVER].[BarcelonaWeekdays] ALTER COLUMN [listing_id] INT NOT NULL;

ALTER TABLE [SILVER].[BarcelonaWeekdays] ADD CONSTRAINT PK_SILVER_BarcelonaWeekdays 
PRIMARY KEY([listing_id]);


-- 6 [SILVER].[Barcelona_Weekends]
SELECT 
	TRY_CAST([Column 0] AS INT) AS listing_id,
	TRY_CAST([realSum] AS DECIMAL(8,2)) AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '') AS [room_type],
	CASE
        WHEN LTRIM(RTRIM(room_shared)) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM(room_shared)) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS room_shared,
	CASE
        WHEN LTRIM(RTRIM([room_private])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([room_private])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [room_private],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) AS [person_capacity],
	CASE
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [host_is_superhost],
	TRY_CAST([multi] AS BIT) AS multi,
	TRY_CAST([biz] AS BIT) AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT) AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(8,3)) AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(8,3)) AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(8,3)) AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(8,3)) AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(8,3)) AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(8,3)) AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4)) AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4)) AS [lat]
INTO [SILVER].[Barcelona_Weekends]
FROM [BRONZE].[Barcelona_Weekends];

ALTER TABLE [SILVER].[Barcelona_Weekends] ALTER COLUMN [listing_id] INT NOT NULL;

ALTER TABLE [SILVER].[Barcelona_Weekends] ADD CONSTRAINT PK_SILVER_BarcelonaWeekends 
PRIMARY KEY([listing_id]);


-- 7 [SILVER].[BerlinWeekdays]
SELECT 
	TRY_CAST([Column 0] AS INT) AS listing_id,
	TRY_CAST([realSum] AS DECIMAL(8,2)) AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '') AS [room_type],
	CASE
        WHEN LTRIM(RTRIM(room_shared)) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM(room_shared)) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS room_shared,
	CASE
        WHEN LTRIM(RTRIM([room_private])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([room_private])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [room_private],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) AS [person_capacity],
	CASE
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [host_is_superhost],
	TRY_CAST([multi] AS BIT) AS multi,
	TRY_CAST([biz] AS BIT) AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT) AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(8,3)) AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(8,3)) AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(8,3)) AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(8,3)) AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(8,3)) AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(8,3)) AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4)) AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4)) AS [lat]
INTO [SILVER].[BerlinWeekdays]
FROM [BRONZE].[BerlinWeekdays];

ALTER TABLE [SILVER].[BerlinWeekdays] ALTER COLUMN [listing_id] INT NOT NULL;

ALTER TABLE [SILVER].[BerlinWeekdays] ADD CONSTRAINT PK_SILVER_BerlinWeekdays 
PRIMARY KEY([listing_id]);


-- 8 [SILVER].[BerlinWeekends]
SELECT 
	TRY_CAST([Column 0] AS INT) AS listing_id,
	TRY_CAST([realSum] AS DECIMAL(8,2)) AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '') AS [room_type],
	CASE
        WHEN LTRIM(RTRIM(room_shared)) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM(room_shared)) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS room_shared,
	CASE
        WHEN LTRIM(RTRIM([room_private])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([room_private])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [room_private],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) AS [person_capacity],
	CASE
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [host_is_superhost],
	TRY_CAST([multi] AS BIT) AS multi,
	TRY_CAST([biz] AS BIT) AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT) AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(8,3)) AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(8,3)) AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(8,3)) AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(8,3)) AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(8,3)) AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(8,3)) AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4)) AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4)) AS [lat]
INTO [SILVER].[BerlinWeekends]
FROM [BRONZE].[BerlinWeekends];

ALTER TABLE [SILVER].[BerlinWeekends] ALTER COLUMN [listing_id] INT NOT NULL;

ALTER TABLE [SILVER].[BerlinWeekends] ADD CONSTRAINT PK_SILVER_BerlinWeekends 
PRIMARY KEY([listing_id]);


-- 9 [SILVER].[BudapestWeekdays]
SELECT 
	TRY_CAST([Column 0] AS INT) AS listing_id,
	TRY_CAST([realSum] AS DECIMAL(8,2)) AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '') AS [room_type],
	CASE
        WHEN LTRIM(RTRIM(room_shared)) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM(room_shared)) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS room_shared,
	CASE
        WHEN LTRIM(RTRIM([room_private])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([room_private])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [room_private],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) AS [person_capacity],
	CASE
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [host_is_superhost],
	TRY_CAST([multi] AS BIT) AS multi,
	TRY_CAST([biz] AS BIT) AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT) AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(8,3)) AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(8,3)) AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(8,3)) AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(8,3)) AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(8,3)) AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(8,3)) AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4)) AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4)) AS [lat]
INTO [SILVER].[BudapestWeekdays]
FROM [BRONZE].[BudapestWeekdays];

ALTER TABLE [SILVER].[BudapestWeekdays] ALTER COLUMN [listing_id] INT NOT NULL;

ALTER TABLE [SILVER].[BudapestWeekdays] ADD CONSTRAINT PK_SILVER_BudapestWeekdays 
PRIMARY KEY([listing_id]);


-- 10 [SILVER].[BudapestWeekends]
SELECT 
	TRY_CAST([Column 0] AS INT) AS listing_id,
	TRY_CAST([realSum] AS DECIMAL(8,2)) AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '') AS [room_type],
	CASE
        WHEN LTRIM(RTRIM(room_shared)) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM(room_shared)) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS room_shared,
	CASE
        WHEN LTRIM(RTRIM([room_private])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([room_private])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [room_private],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) AS [person_capacity],
	CASE
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [host_is_superhost],
	TRY_CAST([multi] AS BIT) AS multi,
	TRY_CAST([biz] AS BIT) AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT) AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(8,3)) AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(8,3)) AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(8,3)) AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(8,3)) AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(8,3)) AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(8,3)) AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4)) AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4)) AS [lat]
INTO [SILVER].[BudapestWeekends]
FROM [BRONZE].[BudapestWeekends];

ALTER TABLE [SILVER].[BudapestWeekends] ALTER COLUMN [listing_id] INT NOT NULL;

ALTER TABLE [SILVER].[BudapestWeekends] ADD CONSTRAINT PK_SILVER_BudapestWeekends 
PRIMARY KEY([listing_id]);


-- 11 [SILVER].[LisbonWeekdays]
SELECT 
	TRY_CAST([Column 0] AS INT) AS listing_id,
	TRY_CAST([realSum] AS DECIMAL(8,2)) AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '') AS [room_type],
	CASE
        WHEN LTRIM(RTRIM(room_shared)) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM(room_shared)) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS room_shared,
	CASE
        WHEN LTRIM(RTRIM([room_private])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([room_private])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [room_private],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) AS [person_capacity],
	CASE
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [host_is_superhost],
	TRY_CAST([multi] AS BIT) AS multi,
	TRY_CAST([biz] AS BIT) AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT) AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(8,3)) AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(8,3)) AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(8,3)) AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(8,3)) AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(8,3)) AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(8,3)) AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4)) AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4)) AS [lat]
INTO [SILVER].[LisbonWeekdays]
FROM [BRONZE].[LisbonWeekdays];

ALTER TABLE [SILVER].[LisbonWeekdays] ALTER COLUMN [listing_id] INT NOT NULL;

ALTER TABLE [SILVER].[LisbonWeekdays] ADD CONSTRAINT PK_SILVER_LisbonWeekdays 
PRIMARY KEY([listing_id]);


-- 12 [SILVER].[LisbonWeekends]
SELECT 
	TRY_CAST([Column 0] AS INT) AS listing_id,
	TRY_CAST([realSum] AS DECIMAL(8,2)) AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '') AS [room_type],
	CASE
        WHEN LTRIM(RTRIM(room_shared)) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM(room_shared)) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS room_shared,
	CASE
        WHEN LTRIM(RTRIM([room_private])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([room_private])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [room_private],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) AS [person_capacity],
	CASE
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [host_is_superhost],
	TRY_CAST([multi] AS BIT) AS multi,
	TRY_CAST([biz] AS BIT) AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT) AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(8,3)) AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(8,3)) AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(8,3)) AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(8,3)) AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(8,3)) AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(8,3)) AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4)) AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4)) AS [lat]
INTO [SILVER].[LisbonWeekends]
FROM [BRONZE].[LisbonWeekends];

ALTER TABLE [SILVER].[LisbonWeekends] ALTER COLUMN [listing_id] INT NOT NULL;

ALTER TABLE [SILVER].[LisbonWeekends] ADD CONSTRAINT PK_SILVER_LisbonWeekends 
PRIMARY KEY([listing_id]);



-- 13 [SILVER].[LondonWeekdays]
SELECT 
	TRY_CAST([Column 0] AS INT) AS listing_id,
	TRY_CAST([realSum] AS DECIMAL(8,2)) AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '') AS [room_type],
	CASE
        WHEN LTRIM(RTRIM(room_shared)) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM(room_shared)) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS room_shared,
	CASE
        WHEN LTRIM(RTRIM([room_private])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([room_private])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [room_private],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) AS [person_capacity],
	CASE
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [host_is_superhost],
	TRY_CAST([multi] AS BIT) AS multi,
	TRY_CAST([biz] AS BIT) AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT) AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(8,3)) AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(8,3)) AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(8,3)) AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(8,3)) AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(8,3)) AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(8,3)) AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4)) AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4)) AS [lat]
INTO [SILVER].[LondonWeekdays]
FROM [BRONZE].[LondonWeekdays];

ALTER TABLE [SILVER].[LondonWeekdays] ALTER COLUMN [listing_id] INT NOT NULL;

ALTER TABLE [SILVER].[LondonWeekdays] ADD CONSTRAINT PK_SILVER_LondonWeekdays 
PRIMARY KEY([listing_id]);



-- 14 [SILVER].[LondonWeekends]
SELECT 
	TRY_CAST([Column 0] AS INT) AS listing_id,
	TRY_CAST([realSum] AS DECIMAL(8,2)) AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '') AS [room_type],
	CASE
        WHEN LTRIM(RTRIM(room_shared)) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM(room_shared)) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS room_shared,
	CASE
        WHEN LTRIM(RTRIM([room_private])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([room_private])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [room_private],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) AS [person_capacity],
	CASE
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [host_is_superhost],
	TRY_CAST([multi] AS BIT) AS multi,
	TRY_CAST([biz] AS BIT) AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT) AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(8,3)) AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(8,3)) AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(8,3)) AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(8,3)) AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(8,3)) AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(8,3)) AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4)) AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4)) AS [lat]
INTO [SILVER].[LondonWeekends]
FROM [BRONZE].[LondonWeekends];

ALTER TABLE [SILVER].[LondonWeekends] ALTER COLUMN [listing_id] INT NOT NULL;

ALTER TABLE [SILVER].[LondonWeekends] ADD CONSTRAINT PK_SILVER_LondonWeekends 
PRIMARY KEY([listing_id]);


-- 15 [SILVER].[ParisWeekdays]
SELECT 
	TRY_CAST([Column 0] AS INT) AS listing_id,
	TRY_CAST([realSum] AS DECIMAL(8,2)) AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '') AS [room_type],
	CASE
        WHEN LTRIM(RTRIM(room_shared)) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM(room_shared)) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS room_shared,
	CASE
        WHEN LTRIM(RTRIM([room_private])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([room_private])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [room_private],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) AS [person_capacity],
	CASE
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [host_is_superhost],
	TRY_CAST([multi] AS BIT) AS multi,
	TRY_CAST([biz] AS BIT) AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT) AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(8,3)) AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(8,3)) AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(8,3)) AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(8,3)) AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(8,3)) AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(8,3)) AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4)) AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4)) AS [lat]
INTO [SILVER].[ParisWeekdays]
FROM [BRONZE].[ParisWeekdays];

ALTER TABLE [SILVER].[ParisWeekdays] ALTER COLUMN [listing_id] INT NOT NULL;

ALTER TABLE [SILVER].[ParisWeekdays] ADD CONSTRAINT PK_SILVER_ParisWeekdays 
PRIMARY KEY([listing_id]);


-- 16 [SILVER].[ParisWeekends]
SELECT 
	TRY_CAST([Column 0] AS INT) AS listing_id,
	TRY_CAST([realSum] AS DECIMAL(8,2)) AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '') AS [room_type],
	CASE
        WHEN LTRIM(RTRIM(room_shared)) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM(room_shared)) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS room_shared,
	CASE
        WHEN LTRIM(RTRIM([room_private])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([room_private])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [room_private],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) AS [person_capacity],
	CASE
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [host_is_superhost],
	TRY_CAST([multi] AS BIT) AS multi,
	TRY_CAST([biz] AS BIT) AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT) AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(8,3)) AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(8,3)) AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(8,3)) AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(8,3)) AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(8,3)) AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(8,3)) AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4)) AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4)) AS [lat]
INTO [SILVER].[ParisWeekends]
FROM [BRONZE].[ParisWeekends];

ALTER TABLE [SILVER].[ParisWeekends] ALTER COLUMN [listing_id] INT NOT NULL;

ALTER TABLE [SILVER].[ParisWeekends] ADD CONSTRAINT PK_SILVER_ParisWeekends 
PRIMARY KEY([listing_id]);


-- 17 [SILVER].[RomeWeekdays]
SELECT 
	TRY_CAST([Column 0] AS INT) AS listing_id,
	TRY_CAST([realSum] AS DECIMAL(8,2)) AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '') AS [room_type],
	CASE
        WHEN LTRIM(RTRIM(room_shared)) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM(room_shared)) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS room_shared,
	CASE
        WHEN LTRIM(RTRIM([room_private])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([room_private])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [room_private],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) AS [person_capacity],
	CASE
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [host_is_superhost],
	TRY_CAST([multi] AS BIT) AS multi,
	TRY_CAST([biz] AS BIT) AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT) AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(8,3)) AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(8,3)) AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(8,3)) AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(8,3)) AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(8,3)) AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(8,3)) AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4)) AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4)) AS [lat]
INTO [SILVER].[RomeWeekdays]
FROM [BRONZE].[RomeWeekdays];

ALTER TABLE [SILVER].[RomeWeekdays] ALTER COLUMN [listing_id] INT NOT NULL;

ALTER TABLE [SILVER].[RomeWeekdays] ADD CONSTRAINT PK_SILVER_RomeWeekdays 
PRIMARY KEY([listing_id]);


-- 18 [SILVER].[RomeWeekends]
SELECT 
	TRY_CAST([Column 0] AS INT) AS listing_id,
	TRY_CAST([realSum] AS DECIMAL(8,2)) AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '') AS [room_type],
	CASE
        WHEN LTRIM(RTRIM(room_shared)) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM(room_shared)) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS room_shared,
	CASE
        WHEN LTRIM(RTRIM([room_private])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([room_private])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [room_private],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) AS [person_capacity],
	CASE
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [host_is_superhost],
	TRY_CAST([multi] AS BIT) AS multi,
	TRY_CAST([biz] AS BIT) AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT) AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(8,3)) AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(8,3)) AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(8,3)) AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(8,3)) AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(8,3)) AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(8,3)) AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4)) AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4)) AS [lat]
INTO [SILVER].[RomeWeekends]
FROM [BRONZE].[RomeWeekends];

ALTER TABLE [SILVER].[RomeWeekends] ALTER COLUMN [listing_id] INT NOT NULL;

ALTER TABLE [SILVER].[RomeWeekends] ADD CONSTRAINT PK_SILVER_RomeWeekends 
PRIMARY KEY([listing_id]);


-- 19 [SILVER].[ViennaWeekdays]
SELECT 
	TRY_CAST([Column 0] AS INT) AS listing_id,
	TRY_CAST([realSum] AS DECIMAL(8,2)) AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '') AS [room_type],
	CASE
        WHEN LTRIM(RTRIM(room_shared)) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM(room_shared)) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS room_shared,
	CASE
        WHEN LTRIM(RTRIM([room_private])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([room_private])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [room_private],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) AS [person_capacity],
	CASE
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [host_is_superhost],
	TRY_CAST([multi] AS BIT) AS multi,
	TRY_CAST([biz] AS BIT) AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT) AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(8,3)) AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(8,3)) AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(8,3)) AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(8,3)) AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(8,3)) AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(8,3)) AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4)) AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4)) AS [lat]
INTO [SILVER].[ViennaWeekdays]
FROM [BRONZE].[ViennaWeekdays];

ALTER TABLE [SILVER].[ViennaWeekdays] ALTER COLUMN [listing_id] INT NOT NULL;

ALTER TABLE [SILVER].[ViennaWeekdays] ADD CONSTRAINT PK_SILVER_ViennaWeekdays 
PRIMARY KEY([listing_id]);



-- 20 [SILVER].[ViennaWeekends]
SELECT 
	TRY_CAST([Column 0] AS INT) AS listing_id,
	TRY_CAST([realSum] AS DECIMAL(8,2)) AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '') AS [room_type],
	CASE
        WHEN LTRIM(RTRIM(room_shared)) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM(room_shared)) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS room_shared,
	CASE
        WHEN LTRIM(RTRIM([room_private])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([room_private])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [room_private],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT) AS [person_capacity],
	CASE
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'True' THEN CAST(1 AS BIT)
        WHEN LTRIM(RTRIM([host_is_superhost])) = 'False' THEN CAST(0 AS BIT)
        ELSE NULL
    END AS [host_is_superhost],
	TRY_CAST([multi] AS BIT) AS multi,
	TRY_CAST([biz] AS BIT) AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT) AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT) AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT) AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(8,3)) AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(8,3)) AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(8,3)) AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(8,3)) AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(8,3)) AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(8,3)) AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4)) AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4)) AS [lat]
INTO [SILVER].[ViennaWeekends]
FROM [BRONZE].[ViennaWeekends];

ALTER TABLE [SILVER].[ViennaWeekends] ALTER COLUMN [listing_id] INT NOT NULL;

ALTER TABLE [SILVER].[ViennaWeekends] ADD CONSTRAINT PK_SILVER_ViennaWeekends 
PRIMARY KEY([listing_id]);