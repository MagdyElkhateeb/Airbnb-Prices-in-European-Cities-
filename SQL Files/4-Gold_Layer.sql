CREATE SCHEMA GOLD;
GO

--0 Staging 
CREATE VIEW Staging_Silver_AllListings AS

SELECT *, 'Amsterdam' AS city_name, 'Weekday' AS week_type FROM [SILVER].[AmsterdamWeekdays]
UNION ALL
SELECT *, 'Amsterdam' AS city_name, 'Weekend' AS week_type FROM [SILVER].[AmsterdamWeekends]

UNION ALL

SELECT *, 'Athens' AS city_name, 'Weekday' AS week_type FROM [SILVER].[AthensWeekdays]
UNION ALL
SELECT *, 'Athens' AS city_name, 'Weekend' AS week_type FROM [SILVER].[AthensWeekends]

UNION ALL

SELECT *, 'Barcelona' AS city_name, 'Weekday' AS week_type FROM [SILVER].[BarcelonaWeekdays]
UNION ALL
SELECT *, 'Barcelona' AS city_name, 'Weekend' AS week_type FROM [SILVER].[BarcelonaWeekends]

UNION ALL

SELECT *, 'Berlin' AS city_name, 'Weekday' AS week_type FROM [SILVER].[BerlinWeekdays]
UNION ALL
SELECT *, 'Berlin' AS city_name, 'Weekend' AS week_type FROM [SILVER].[BerlinWeekends]

UNION ALL

SELECT *, 'Budapest' AS city_name, 'Weekday' AS week_type FROM [SILVER].[BudapestWeekdays]
UNION ALL
SELECT *, 'Budapest' AS city_name, 'Weekend' AS week_type FROM [SILVER].[BudapestWeekends]

UNION ALL

SELECT *, 'Lisbon' AS city_name, 'Weekday' AS week_type FROM [SILVER].[LisbonWeekdays]
UNION ALL
SELECT *, 'Lisbon' AS city_name, 'Weekend' AS week_type FROM [SILVER].[LisbonWeekends]

UNION ALL

SELECT *, 'London' AS city_name, 'Weekday' AS week_type FROM [SILVER].[LondonWeekdays]
UNION ALL
SELECT *, 'London' AS city_name, 'Weekend' AS week_type FROM [SILVER].[LondonWeekends]

UNION ALL

SELECT *, 'Paris' AS city_name, 'Weekday' AS week_type FROM [SILVER].[ParisWeekdays]
UNION ALL
SELECT *, 'Paris' AS city_name, 'Weekend' AS week_type FROM [SILVER].[ParisWeekends]

UNION ALL

SELECT *, 'Rome' AS city_name, 'Weekday' AS week_type FROM [SILVER].[RomeWeekdays]
UNION ALL
SELECT *, 'Rome' AS city_name, 'Weekend' AS week_type FROM [SILVER].[RomeWeekends]

UNION ALL

SELECT *, 'Vienna' AS city_name, 'Weekday' AS week_type FROM [SILVER].[BarcelonaWeekdays]
UNION ALL
SELECT *, 'Vienna' AS city_name, 'Weekend' AS week_type FROM [SILVER].[ViennaWeekends]


-- 1 GOLD.DimCity
CREATE TABLE GOLD.DimCity (
	city_id INT NOT NULL PRIMARY KEY,
	city_name VARCHAR(50)
)

INSERT INTO GOLD.DimCity (
	city_id,
	city_name
)
VALUES(
	1,
	'Amsterdam'
)

INSERT INTO GOLD.DimCity (
	city_id,
	city_name
)
VALUES(
	2,
	'Athens'
)

INSERT INTO GOLD.DimCity (
	city_id,
	city_name
)
VALUES(
	3,
	'Barcelona'
)

INSERT INTO GOLD.DimCity (
	city_id,
	city_name
)
VALUES(
	4,
	'Berlin'
)

INSERT INTO GOLD.DimCity (
	city_id,
	city_name
)
VALUES(
	5,
	'Budapest'
)

INSERT INTO GOLD.DimCity (
	city_id,
	city_name
)
VALUES(
	6,
	'Lisbon'
)

INSERT INTO GOLD.DimCity (
	city_id,
	city_name
)
VALUES(
	7,
	'London'
)

INSERT INTO GOLD.DimCity (
	city_id,
	city_name
)
VALUES(
	8,
	'Paris'
)

INSERT INTO GOLD.DimCity (
	city_id,
	city_name
)
VALUES(
	9,
	'Rome'
)

INSERT INTO GOLD.DimCity (
	city_id,
	city_name
)
VALUES(
	10,
	'Vienna'
)


-- 2 GOLD.DimRoomType
CREATE TABLE GOLD.DimRoomType (
	roomtype_id INT NOT NULL PRIMARY KEY,
	roomtype VARCHAR(50)
)

INSERT INTO GOLD.DimRoomType (
	roomtype_id,
	roomtype
)
VALUES(
	1,
	'Private room'
)

INSERT INTO GOLD.DimRoomType (
	roomtype_id,
	roomtype
)
VALUES(
	2,
	'Entire home/apt'
)

INSERT INTO GOLD.DimRoomType (
	roomtype_id,
	roomtype
)
VALUES(
	3,
	'Shared room'
)


-- 3 GOLD.DimWeekType
CREATE TABLE GOLD.DimWeekType (
	weektype_id INT NOT NULL PRIMARY KEY,
	weektype VARCHAR(50)
)

INSERT INTO GOLD.DimWeekType (
	weektype_id,
	weektype
)
VALUES(
	1,
	'Weekday'
)

INSERT INTO GOLD.DimWeekType (
	weektype_id,
	weektype
)
VALUES(
	2,
	'Weekend'
)


-- 4 GOLD.DimProperty
CREATE TABLE GOLD.DimProperty (
	property_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	bedrooms INT,
	person_capacity INT,
	host_is_superhost BIT,
	multi BIT,
	biz BIT
)

INSERT INTO GOLD.DimProperty (bedrooms, person_capacity, host_is_superhost, multi, biz)
SELECT DISTINCT 
    bedrooms, 
    person_capacity, 
    host_is_superhost, 
    multi, 
    biz
FROM Staging_Silver_AllListings;


-- 5 GOLD.DimLocation
CREATE TABLE GOLD.DimLocation (
	location_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	dist DECIMAL(8,3),
	metro_dist DECIMAL(8,3),
	lat DECIMAL(9,4),
	lng DECIMAL(9,4),
	attr_index DECIMAL(8,3),
	rest_index DECIMAL(8,3)
)

INSERT INTO Gold.DimLocation (dist, metro_dist, lat, lng, attr_index, rest_index)
SELECT DISTINCT 
    dist, 
    metro_dist,  
    lat, 
    lng, 
    attr_index_norm, 
    rest_index_norm
FROM Staging_Silver_AllListings;


-- 6 GOLD.FactListings
CREATE TABLE GOLD.FactListings (
    listing_id INT IDENTITY(1,1) PRIMARY KEY, 
    real_sum DECIMAL(8,2),
    cleanliness_rating INT,
    guest_satisfaction INT,
    
    city_id INT FOREIGN KEY REFERENCES [GOLD].[DimCity](city_id),
    weektype_id INT FOREIGN KEY REFERENCES [GOLD].[DimWeekType](weektype_id),
    roomtype_id INT FOREIGN KEY REFERENCES [GOLD].[DimRoomType](roomtype_id),
    property_id INT FOREIGN KEY REFERENCES [GOLD].[DimProperty](property_id),
    location_id INT FOREIGN KEY REFERENCES [GOLD].[DimLocation](location_id)
);

INSERT INTO GOLD.FactListings (
    real_sum,
    cleanliness_rating,
    guest_satisfaction,
    city_id,
    weektype_id,
    roomtype_id,
    property_id,
    location_id
)
SELECT 
    s.realSum,
    s.cleanliness_rating,
    s.guest_satisfaction_overall,
    c.city_id,
    wt.weektype_id,
    rt.roomtype_id,
    p.property_id,
    l.location_id
FROM Staging_Silver_AllListings s

JOIN [GOLD].[DimCity] c 
    ON s.city_name = c.city_name

JOIN [GOLD].[DimWeekType] wt 
    ON s.week_type = wt.weektype

JOIN [GOLD].[DimRoomType] rt 
    ON s.room_type = rt.roomtype

JOIN [GOLD].[DimProperty] p 
    ON s.bedrooms = p.bedrooms 
   AND s.person_capacity = p.person_capacity 
   AND s.host_is_superhost = p.host_is_superhost
   AND s.multi = p.multi
   AND s.biz = p.biz

JOIN [GOLD].[DimLocation] l 
    ON s.dist = l.dist 
   AND s.metro_dist = l.metro_dist 
   AND s.lat = l.lat
   AND s.lng = l.lng
   AND s.attr_index_norm = l.attr_index
   AND s.rest_index_norm = l.rest_index;


CREATE INDEX IX_FACT_cityId ON  [GOLD].[FactListings]([city_id]);

CREATE INDEX IX_FACT_weektypeId ON [GOLD].[FactListings]([weektype_id]);

CREATE INDEX IX_FACT_roomTypeId ON [GOLD].[FactListings]([roomtype_id]);

CREATE INDEX IX_FACT_propertyId ON [GOLD].[FactListings]([property_id]);

CREATE INDEX IX_FACT_locationId ON [GOLD].[FactListings]([location_id]);