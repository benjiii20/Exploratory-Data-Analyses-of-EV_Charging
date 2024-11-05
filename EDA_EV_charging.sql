-- Exploratory Data Analyses 

select*
from charging_data3;

-- Instalations cout per Betreiber

SELECT 
EXTRACT(YEAR FROM inbetriebnahmedatum) AS year,
betreiber,
COUNT(*) AS installations_count
FROM charging_data3
GROUP BY year, betreiber
ORDER BY year
;

-- General installation Growth Over Time

SELECT 
EXTRACT(YEAR FROM inbetriebnahmedatum) AS year,
COUNT(*) AS installations_count
FROM charging_data3
GROUP BY year
ORDER BY year
;

-- Distribution of Charging types

select
art_der_ladeeinrichung,
count(*) as total_stations
from 
charging_data3
group by 
art_der_ladeeinrichung
order by 
total_stations desc
;

-- Average Power Capacity and Number of Charging Points by Type

SELECT 
art_der_ladeeinrichung,
MIN(anschlussleistung) AS min_power_capacity,
MAX(anschlussleistung) AS max_power_capacity,
AVG(anschlussleistung) AS avg_power_capacity,
avg(anzahl_ladepunkte) as avg_charging_points
FROM 
charging_data3
GROUP BY 
art_der_ladeeinrichung
ORDER BY 
avg_power_capacity DESC
;

-- Top 10 stations by Power Capacity

SELECT * 
FROM 
charging_data3
ORDER BY 
anschlussleistung DESC
LIMIT 10
;

-- Average Power Capacity Over Time

SELECT 
EXTRACT(YEAR FROM inbetriebnahmedatum) AS year,
AVG(anschlussleistung) AS avg_power_capacity 
FROM 
charging_data3
GROUP BY 
year
ORDER BY 
year
;
    


