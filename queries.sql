--Overview of Weather, Demand, Wind Speed, and Humidity in 2017
--Average Demand by Temperature Category
CREATE TABLE AvgDTempC( 
Temp_Category	TEXT,
avg_demand	REAL
);
INSERT INTO AvgDTempC
SELECT tem.temp_category, AVG(car.demand) AS avg_demand
FROM Temperaturetab tem
JOIN CarSharing_df car ON tem.temp_code = car.temp_code
JOIN Timetab tim on car.id = tim.id
WHERE strftime('%Y', tim.timestamp) = '2017'
GROUP BY temp_category
ORDER BY avg_demand DESC;

SELECT * FROM AvgDTempC

-- weather frequency
CREATE TABLE MostWeath (
Weather	TEXT,
Frequency
);
INSERT INTO MostWeath
SELECT weather, COUNT(*) AS Frequency
FROM weathertab wea
JOIN CarSharing_df car ON wea.weather_code = car.weather_code
JOIN Timetab tim on car.id = tim.id
WHERE strftime('%Y', tim.timestamp) = '2017'
GROUP BY weather
ORDER BY frequency DESC
LIMIT 1;

SELECT * FROM MostWeath

-- Monthly Wind Speed and Humidity Statistics
CREATE TABLE Monwinds (
month	INT,
avg_windspeed REAL,
max_windspeed REAL,
min_windspeed REAL
);

INSERT INTO Monwinds
SELECT strftime('%m', tim.timestamp) AS month,
       AVG(car.windspeed) AS avg_windspeed,
       MAX(car.windspeed) AS max_windspeed,
       MIN(car.windspeed) AS min_windspeed
FROM Timetab tim
JOIN CarSharing_df car on tim.id = car.id
WHERE strftime('%Y', timestamp) = '2017'
GROUP BY month
ORDER BY month;

SELECT * FROM Monwinds

CREATE TABLE Monhums (
month	INT,
avg_humidity REAL,
max_humidity REAL,
min_humidity REAL
);

INSERT INTO Monhums
SELECT strftime('%m', tim.timestamp) AS month,
       AVG(car.humidity) AS avg_humidity,
       MAX(car.humidity) AS max_humidity,
       MIN(car.humidity) AS min_humidity
FROM Timetab tim
JOIN CarSharing_df car on tim.id = car.id
WHERE strftime('%Y', timestamp) = '2017'
GROUP BY month
ORDER BY month;

SELECT * FROM Monhums


-- Month with Highest Average Demand Wind and Hum
CREATE TABLE HadMonwinhum (
month_name TEXT,
avg_windspeed REAL,
max_windspeed REAL,
min_windspeed REAL,
avg_humidity REAL,
max_humidity REAL,
min_humidity REAL
);
INSERT INTO HadMonwinhum
SELECT month_name,
	   AVG(car.windspeed) AS avg_windspeed,
       MAX(car.windspeed) AS max_windspeed,
       MIN(car.windspeed) AS min_windspeed,
	   AVG(car.windspeed) AS avg_humidity,
       MAX(car.windspeed) AS max_humidity,
       MIN(car.windspeed) AS min_humidity
FROM CarSharing_df car
JOIN timetab tim ON car.id = tim.id
WHERE strftime('%Y', tim.timestamp) = '2017' AND strftime('%m', tim.timestamp) = '07';

SELECT * FROM HadMonwinhum

-- Q.344 Hourly Average Demand for the Highest/Lowest Demand Weekday
DROP table if EXISTS lowestday_HAD;
drop table if EXISTS highestday_HAD;

--Hourly average demand for the Highest Demand Weekday
CREATE TABLE Hday_HAD (
	Hour TEXT,
	avg_demand REAL
);

INSERT INTO Hday_HAD
SELECT tim.hour, AVG(car.demand) AS avg_demand
FROM CarSharing_df car
JOIN Timetab tim on car.id = tim.id
WHERE strftime('%Y', timestamp) = '2017' AND weekday_name = 'Sunday'
GROUP BY Hour
ORDER BY avg_demand DESC;

--Hourly average demand for the Lowest Demand Weekday
CREATE TABLE Lday_HAD (
	Hour TEXT,
	avg_demand REAL
);

INSERT INTO Lday_HAD
SELECT tim.hour as Hour, AVG(car.demand) AS avg_demand
FROM CarSharing_df car
JOIN Timetab tim on car.id = tim.id
WHERE strftime('%Y', timestamp) = '2017' AND weekday_name = 'Thursday'
GROUP BY hour
ORDER BY avg_demand DESC;

SELECT * FROM Hday_HAD
SELECT * FROM lday_HAD

--Q. Creating Table for Weekday, Season and Month
DROP TABLE IF EXISTS Weekday_Demand;

CREATE TABLE Weekday_Demand (
    weekday_name TEXT,
    avg_demand REAL
);

INSERT INTO Weekday_Demand
SELECT tim.weekday_name, AVG(car.demand) AS avg_demand
FROM CarSharing_df car
JOIN Timetab tim ON car.id = tim.id
WHERE strftime('%Y', tim.timestamp) = '2017'
GROUP BY tim.weekday_name
ORDER BY avg_demand DESC
LIMIT 1;

INSERT INTO Weekday_Demand
SELECT tim.weekday_name, AVG(car.demand) AS avg_demand
FROM CarSharing_df car
JOIN timetab tim ON car.id = tim.id
WHERE strftime('%Y', tim.timestamp) = '2017'
GROUP BY tim.weekday_name
ORDER BY avg_demand ASC
LIMIT 1;

CREATE TABLE Season_Demand (
	season_name TEXT,
	ss_avg_demand REAL
);

INSERT INTO Season_Demand
SELECT tim.season as season_name, avg (car.demand) as ss_avg_demand
FROM CarSharing_df car
JOIN timetab tim ON car.id = tim.id
WHERE strftime('%Y', tim.timestamp) = '2017'
GROUP BY tim.season
ORDER BY ss_avg_demand DESC
LIMIT 1;

INSERT INTO Season_Demand
SELECT tim.season as season_name, avg (car.demand) as ss_avg_demand
FROM CarSharing_df car
JOIN timetab tim ON car.id = tim.id
WHERE strftime('%Y', tim.timestamp) = '2017'
GROUP BY tim.season
ORDER BY ss_avg_demand ASC
LIMIT 1;

CREATE TABLE Month_Demand (
	month_name TEXT,
	m_avg_demand REAL
);

INSERT INTO Month_Demand
SELECT tim.Month_name as Month_name, avg (car.demand) as m_avg_demand
FROM CarSharing_df car
JOIN timetab tim ON car.id = tim.id
WHERE strftime('%Y', tim.timestamp) = '2017'
GROUP BY tim.Month_name
ORDER BY m_avg_demand DESC
LIMIT 1

INSERT INTO Month_Demand
SELECT tim.Month_name as Month_name, avg (car.demand) as m_avg_demand
FROM CarSharing_df car
JOIN timetab tim ON car.id = tim.id
WHERE strftime('%Y', tim.timestamp) = '2017'
GROUP BY tim.Month_name
ORDER BY m_avg_demand ASC
LIMIT 1;


--Date and Time with the Highest Demand Rate in 2017
--Finding the Date and Time with the Highest Demand Rate in 2017
SELECT tim.timestamp as DatenTime, car.demand as DemandR
FROM CarSharing_df car
JOIN Timetab tim ON car.id = tim.id
WHERE strftime('%Y', tim.timestamp) = '2017'
ORDER BY DemandR DESC
LIMIT 1;
