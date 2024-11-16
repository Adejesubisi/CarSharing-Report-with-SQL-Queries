# CarSharing-Report-with-SQL-Queries
This repository contains SQL queries and analysis for the CarSharing project, including demand insights, weather impact, and data documentation
## Brief Project Description:
The CarSharing Report project aims to analyze car-sharing data to uncover patterns in demand, weather influence, and time-related trends. Using structured datasets and SQL queries, this project provides actionable insights for marketing and operations teams. The data is organized into four interconnected tables: CarSharing_df, Weather, Temperature, and Time. Each table focuses on a specific aspect of the car-sharing data and is linked using primary and foreign keys to maintain relational integrity.

## Data Description:
### 1. CarSharing_df Table
  This is the primary dataset containing key information about car-sharing usage.
   - **id (INTEGER)**: Unique identifier for each record; primary key.
   - **holiday (TEXT)**: Indicates whether the record corresponds to a holiday.
   - **workingday (TEXT)**: Indicates if the record is a working day.
   - **humidity (REAL)**: Measures the level of humidity.
   - **windspeed (REAL)**: Measures the wind speed.
   - **demand (REAL)**: Represents the car-sharing demand.
   - **Temp_Code (TEXT)**: Links to the Temp_Code in the Temperature table; foreign key.
   - **Weather_Code (INTEGER)**: Links to the Weather_Code in the Weather table; foreign key.

### 2. Weather Table (weathertab)
  This table categorizes weather conditions for each record.
   - **weather (TEXT)**: Description of the weather condition (e.g., "Clear", "Mist").
   - **Weather_Code (INTEGER)**: Unique identifier for each weather condition; primary key.

### 3. Temperature Table (temperaturetab)
  This table contains temperature-related information.
   - **Temp (INTEGER)**: The actual temperature.
   - **Temp_Feel (INTEGER)**: The perceived or "feels like" temperature.
   - **Temp_Category (TEXT)**: Categorizes temperature as "Cold", "Mild", or "Hot".
   - **Temp_Code (TEXT)**: Unique identifier combining temperature attributes; primary key.
### 4. Time Table (Timetab)
  This table provides time-based information derived from timestamps.
   - **id (INTEGER)**: Matches the id in the CarSharing_df table; primary key.
   - **timestamp (DATETIME)**: The date and time of the record.
   - **season (TEXT)**: The season during the record (e.g., "Summer").
   - **Hour (INTEGER)**: Hour of the day (0-23).
   - **Weekday_name (TEXT)**: Day of the week (e.g., "Monday").
   - **Month_name (TEXT)**: Month of the year (e.g., "January").
## ER Diagram:
![AMOS_CARSHARING_EERD](https://github.com/user-attachments/assets/746c5da4-34b2-4c85-bf8c-f8c3395ae143)
## SQL QUERIES
- **(a)**: Date and time with highest demand in 2017.
- **(b)**: Weekday, month, and season with highest/lowest average demand in 2017.
- **(c)**: Hourly demand analysis for selected weekday in (b).
- **(d)**: Weather analysis for 2017.
- **(e)**: Weather analysis of month with highest demand in 2017.
All SQL queries used for this project are available in the [`queries.sql`](queries.sql) file.

## CSV Results

The following results are available:

- [File 1](Avg_Demand_By_Tem-Category.csv)
- [File 2](Highest_Demand-Month_Stats.csv)
- [File 3](Highestday_HourlyAverageDemand.csv)
- [File 4](High-Low_Month_Demand.csv)
- [File 5](High-Low_Weekday_Avg_Demand.csv)
- [File 6](Lowestday_HourlyAverageDemand.csv)
- [File 7](MonHadTempC.csv)
- [File 8](MonHadWeathF.csv)
- [File 9](Monthly_Humidity_Stat.csv)
- [File 10](Monthly_windspeed_Stat.csv)
- [File 11](Most_Frequent_Weather.csv)
- [File 12](Seasonal_AvgDemand.csv)
- [File 13](HDR_DateT.csv)

## Conclusion
Based on the detailed analysis conducted from the car-sharing data for the year 2017, the following conclusions can be drawn:

### **1.** Peak Demand Observations
The data reveals that the highest demand occurred on June 15, 2017, at 5 PM, with a demand value of 6.46. This suggests that summer evenings, particularly around 5 PM, are a critical time to ensure adequate resources are available.

### **2.** Demand Patterns

**Seasonal Demand:**
   - Demand peaks in Fall (average: 5.37) and drops during Spring (average: 4.30). This seasonal variation could be leveraged in resource planning.

**Monthly Trends:**
   - July sees the highest average demand (5.50), while January experiences the lowest (4.04). This aligns with warmer weather promoting car-sharing usage.

**Weekly Insights:**
   - Sundays recorded the highest average demand (5.12), with Thursdays having the lowest (4.79). Weekends clearly play a significant role in driving demand.

 **Hourly Demand:**
   - On Sundays, demand peaks between 12 PM and 5 PM, with 3 PM being the busiest hour (5.54 average demand). For Thursdays, peak demand occurs at 5 PM, with an average of 5.77. These hourly trends indicate the need for targeted fleet availability during these windows.

### **3.** Weather and Temperature Insights

 **Weather Patterns:**
   - Clear or partly cloudy conditions dominated in 2017 (2114 occurrences), aligning with higher demand. It's worth noting that adverse weather conditions might suppress usage.
 
 **Temperature and Demand:**
   - The highest demand occurred during Mild temperatures (average: 5.09), followed by Hot temperatures (5.00). Cold temperatures saw the lowest demand (4.04).

### **4.** Environmental Factors

 **Wind Speed:**
   - Wind speeds were lowest in October (average: 11.81 km/h) and highest in April (18.00 km/h). The maximum wind speed recorded was 57.00 km/h in July.

 **Humidity:**
   - Humidity peaked at 70.20% in September and was lowest in February (47.73%). The extremes of 100% and 0% were observed across several months.

### **5.** July: The Month of Highest Demand

 **Temperature Impact:**
  - Demand in July was highest during Mild temperatures (5.91) and lowest during Cold temperatures (3.76).

 **Weather Conditions:**
  - Clear or partly cloudy conditions were most prevalent in July (229 occurrences).

 **Environmental Factors:**
  - July's average wind speed was 13.47 km/h, and average humidity stood at 56.02%.

## Recommendations
After analyzing the car-sharing data for 2017, I’ve outlined key insights and actionable recommendations to help optimize operations and meet demand effectively.

### **1.** Optimize Resource Allocation:
   - Prioritize fleet availability on Sunday afternoons, especially between 12 PM and 5 PM, and Thursday evenings around 5 PM.
   - Boost operational readiness during Fall and the month of July, which have consistently high demand.
### **2.** Marketing Opportunities:
  - Develop promotions for Spring and Thursdays, as these periods show lower demand and potential for growth.
  - Highlight favorable weather conditions to attract users, especially during Mild temperature seasons.
### **3**  Weather-Responsive Planning:
   - Prepare for decreased demand during colder temperatures and high winds, ensuring cost-effective operations.
### **4** Seasonal Campaigns:
   - Leverage July's high demand with targeted marketing campaigns, focusing on Mild weather and clear conditions.

This report provides a roadmap for streamlining operations and maximizing revenue. Please let me know if you'd like further breakdowns or additional analyses.

## Author
[Adejesubisi, Amos Akintola](https://www.linkedin.com/in/adejesubisi)








