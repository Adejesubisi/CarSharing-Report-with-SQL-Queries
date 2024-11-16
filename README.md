# Project Title: CarSharing-Report-with-SQL-Queries
This repository contains SQL queries and analysis for the CarSharing project, including demand insights, weather impact, and data documentation
# Brief Project Description:
The CarSharing Report project aims to analyze car-sharing data to uncover patterns in demand, weather influence, and time-related trends. Using structured datasets and SQL queries, this project provides actionable insights for marketing and operations teams. The data is organized into four interconnected tables: CarSharing_df, Weather, Temperature, and Time. Each table focuses on a specific aspect of the car-sharing data and is linked using primary and foreign keys to maintain relational integrity.

# Data Description:
### 1. CarSharing_df Table
  This is the primary dataset containing key information about car-sharing usage.
    - id (INTEGER): Unique identifier for each record; primary key.
    - holiday (TEXT): Indicates whether the record corresponds to a holiday.
    - workingday (TEXT): Indicates if the record is a working day.
    - humidity (REAL): Measures the level of humidity.
    - windspeed (REAL): Measures the wind speed.
    - demand (REAL): Represents the car-sharing demand.
    - Temp_Code (TEXT): Links to the Temp_Code in the Temperature table; foreign key.
    - Weather_Code (INTEGER): Links to the Weather_Code in the Weather table; foreign key.

### 2. Weather Table (weathertab)
  This table categorizes weather conditions for each record.
    - weather (TEXT): Description of the weather condition (e.g., "Clear", "Mist").
    - Weather_Code (INTEGER): Unique identifier for each weather condition; primary key.

### 3. Temperature Table (temperaturetab)
  This table contains temperature-related information.
    - Temp (INTEGER): The actual temperature.
    - Temp_Feel (INTEGER): The perceived or "feels like" temperature.
    - Temp_Category (TEXT): Categorizes temperature as "Cold", "Mild", or "Hot".
    - Temp_Code (TEXT): Unique identifier combining temperature attributes; primary key.
### 4. Time Table (Timetab)
  This table provides time-based information derived from timestamps.
    - id (INTEGER): Matches the id in the CarSharing_df table; primary key.
    - timestamp (DATETIME): The date and time of the record.
    - season (TEXT): The season during the record (e.g., "Summer").
    - Hour (INTEGER): Hour of the day (0-23).
    - Weekday_name (TEXT): Day of the week (e.g., "Monday").
    - Month_name (TEXT): Month of the year (e.g., "January").
# ER Diagram:
![AMOS_CARSHARING_EERD](https://github.com/user-attachments/assets/746c5da4-34b2-4c85-bf8c-f8c3395ae143)
# SQL QUERIES
- **(a)**: Date and time with highest demand in 2017.
- **(b)**: Weekday, month, and season with highest/lowest average demand in 2017.
- **(c)**: Hourly demand analysis for selected weekday in (b).
- **(d)**: Weather analysis for 2017.
- **(e)**: Weather analysis of month with highest demand in 2017.
All SQL queries used for this project are available in the [`queries.sql`](queries.sql) file.


