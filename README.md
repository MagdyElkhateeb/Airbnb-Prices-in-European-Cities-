# Airbnb Prices in European Cities - End-to-End Data Engineering & Analytics Project

## Project Overview

This project implements an end-to-end data pipeline and business intelligence solution to analyze Airbnb listing prices and performance metrics across major European cities. Built on top of the **Medallion Architecture** (Bronze, Silver, Gold layers) using **Microsoft SQL Server**, the project transforms raw listing datasets into a structured Data Warehouse using a **Star Schema** dimensional model. The finalized data model is directly connected to **Power BI** to deliver interactive dashboards and actionable analytics.

---

## Technical Architecture

The architecture consists of three distinct data processing layers (Medallion pattern) before surfacing insights in Power BI:

```
+-------------------+     +-------------------+     +-------------------+     +-------------------+
|  Raw CSV Datasets | --> |  Bronze Layer     | --> |  Silver Layer     | --> |  Gold Layer       | --> Power BI
|  (European Cities |     |  (Raw Ingestion)  |     |  (Cleaned &       |     |  (Star Schema     |     Dashboard
|   Weekdays/ends)  |     |                   |     |   Standardized)   |     |   Warehouse)      |
+-------------------+     +-------------------+     +-------------------+     +-------------------+
```

---

## Data Pipeline Implementation

### 1. Database Initialization & Bronze Layer (Ingestion)
* **Objective**: Ingest raw datasets into Microsoft SQL Server without altering original data types or structure.
* **Details**:
  * Created database `AirbnbPrices` and dedicated schema `BRONZE`.
  * Imported 20 CSV datasets representing listing data across 10 European cities (Amsterdam, Athens, Barcelona, Berlin, Budapest, Lisbon, London, Paris, Rome, Vienna) split by **Weekdays** and **Weekends**.

### 2. Validation & Exploratory Data Analysis (EDA)
* **Objective**: Assess raw data quality, structural integrity, missing values, and casting compatibility.
* **Key Steps**:
  * Evaluated NULL value distributions across key financial, categorical, and spatial variables.
  * Checked casting viability using `TRY_CAST` for numeric formats, boolean expressions, and string cleansings.
  * Verified categorical consistency (`room_type`, `room_shared`, `room_private`, `host_is_superhost`, `multi`, `biz`).

### 3. Silver Layer (Transformation & Cleansing)
* **Objective**: Standardize types, cleanse floating-point noise from integers, map booleans, and enforce relational constraints.
* **Key Transformations**:
  * Standardized financial figures (`realSum`) to `DECIMAL(8,2)` and spatial metrics (`dist`, `metro_dist`, indices) to `DECIMAL(8,3)`.
  * Converted text representation of booleans (`True`/`False`) into native SQL `BIT` types.
  * Cleansed string-formatted integer fields (e.g., stripping `.0` from `person_capacity`, `cleanliness_rating`, `guest_satisfaction_overall`).
  * Enforced primary key constraints (`listing_id`) on all 20 standardized city tables under the `SILVER` schema.

### 4. Gold Layer (Dimensional Modeling - Star Schema)
* **Objective**: Build a multi-dimensional star schema optimized for analytical query performance and BI modeling.
* **Details**:
  * Unified all Silver tables via a staging view (`Staging_Silver_AllListings`).
  * Built normalized Dimension Tables and a centralized Fact Table:
    * **`GOLD.DimCity`**: Maps European cities with unique identifiers.
    * **`GOLD.DimRoomType`**: Categorizes listing types (*Entire home/apt*, *Private room*, *Shared room*).
    * **`GOLD.DimWeekType`**: Distinguishes timeframes (*Weekday* vs. *Weekend*).
    * **`GOLD.DimProperty`**: Captures property configurations (*bedrooms*, *person_capacity*, *superhost*, *multi-listing*, *business flag*).
    * **`GOLD.DimLocation`**: Captures spatial properties (*distance to center*, *distance to metro*, *latitude/longitude*, *attraction/restaurant indices*).
    * **`GOLD.FactListings`**: Stores core numerical metrics (`real_sum`, `cleanliness_rating`, `guest_satisfaction`) linked to dimension surrogate keys.
  * Added non-clustered indexes on all foreign keys in `FactListings` for query optimization.

---

## Data Warehouse Schema Model

```
                     +--------------------+
                     |    DimProperty     |
                     +--------------------+
                     | PK property_id     |
                     |    bedrooms        |
                     |    person_capacity |
                     |    host_is_superhost|
                     |    multi           |
                     |    biz             |
                     +---------+----------+
                               |
                               |
+--------------------+         |         +--------------------+
|      DimCity       |         |         |    DimWeekType     |
+--------------------+         |         +--------------------+
| PK city_id         |         |         | PK weektype_id     |
|    city_name       |         |         |    weektype        |
+---------+----------+         |         +----------+---------+
          |                    |                    |
          +-----------------+  |  +-----------------+
                            |  |  |
                            v  v  v
                     +--------------------+
                     |    FactListings    |
                     +--------------------+
                     | PK listing_id      |
                     |    real_sum        |
                     |    cleanliness_rat |
                     |    guest_satisfac  |
                     | FK city_id         |
                     | FK weektype_id     |
                     | FK roomtype_id     |
                     | FK property_id     |
                     | FK location_id     |
                     +---+------------+---+
                         |            |
                         |            |
         +---------------+            +---------------+
         |                                            |
         v                                            v
+--------------------+                       +--------------------+
|    DimLocation     |                       |    DimRoomType     |
+--------------------+                       +--------------------+
| PK location_id     |                       | PK roomtype_id     |
|    dist            |                       |    roomtype        |
|    metro_dist      |                       +--------------------+
|    lat, lng        |
|    attr_index      |
|    rest_index      |
+--------------------+
```

---

## Power BI Dashboard & Insights

The database is connected directly to Power BI from Microsoft SQL Server to deliver real-time interactive business intelligence.

### Key Performance Indicators (KPIs)
* **Total Listings**: 52K listings across target markets.
* **Average Price**: €281.48 per listing.
* **Average Guest Satisfaction**: 92.54 / 100.
* **Average Cleanliness Rating**: 9.38 / 10.
* **Superhost Ratio**: 25.24%.

### Visual Analyses
1. **Average Price by Week Type & City**: Evaluates pricing differences between weekend and weekday listings across all 10 cities.
2. **Average Price by Room Type**: Highlights pricing hierarchy across Entire Homes/Apartments, Private Rooms, and Shared Rooms.
3. **Price vs. Metro Distance & Attraction Index**: Scatter plots analyzing the impact of proximity to public transit and major tourist attractions on listing pricing.
4. **Guest Satisfaction by Host Status**: Evaluates the rating performance difference between Superhosts and standard hosts.

---

## Project Structure

```
.
├── 1-DDL.sql          # Creates database and Bronze schema
├── 2-Validation.sql   # Data quality, NULL checks, and type validation queries
├── 3-Silver_Layer.sql # Transformation, data cleaning, and type casting scripts
├── 4-Gold_Layer.sql   # Star schema creation, dimensions, facts, and indexing
└── README.md          # Comprehensive project documentation
```

---

## How to Execute

1. **Database Initialization**: Run `1-DDL.sql` in SQL Server Management Studio (SSMS) to initialize the database structure.
2. **Bronze Load**: Ingest raw European Airbnb CSV files into `BRONZE` tables.
3. **Validation**: Execute `2-Validation.sql` to verify data quality and readiness for transformation.
4. **Silver Transformation**: Execute `3-Silver_Layer.sql` to generate cleansed tables.
5. **Gold Data Warehouse**: Run `4-Gold_Layer.sql` to generate staging views, dimension tables, fact tables, and performance indexes.
6. **BI Connection**: Open Power BI, connect using SQL Server DirectQuery or Import mode pointing to database `AirbnbPrices`, select tables under schema `GOLD`, and build visual layouts.