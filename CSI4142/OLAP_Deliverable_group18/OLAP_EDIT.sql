

--Drill Down
--Query result: Number of crimes that occurred on 10700 E DARTMOUTH AVE before 2015 per type of impact
SELECT c.crime_type,count(*)
FROM "CSI4142"."Location" as l 
INNER JOIN "CSI4142"."crime_fact" as cf
ON l.location_key = cf.location_key
INNER JOIN "CSI4142"."crime" as c
ON c.crime_key = cf.crime_key
INNER JOIN "CSI4142"."Date" as d
ON d.date_key = cf.date_key
WHERE location_name = '10700 E DARTMOUTH AVE' AND d.year <='2015'
GROUP BY crime_type

--Query result: Number of non-violent crimes that occurred on neighborhood that has a greater than 25  neighborhoodstats in feburary  per type of impact
SELECT c.crime_type,count(*)
FROM "CSI4142"."Location" as l 
INNER JOIN "CSI4142"."crime_fact" as cf
ON l.location_key = cf.location_key
INNER JOIN "CSI4142"."crime" as c
ON c.crime_key = cf.crime_key
INNER JOIN "CSI4142"."Date" as d
ON d.date_key = cf.date_key
WHERE l.neighborhoodstats::int >= 25 AND d.month ='2' AND c.crime_severity_index = 'non-violent'
GROUP BY crime_type

--Roll Up
--Number of crimes grouped by crime type and location name as a group and individual
SELECT c.crime_type, l.location_name,
GROUPING(c.crime_type, l.location_name), SUM(cf.is_fatal::int)
FROM "CSI4142"."crime" as c 
INNER JOIN "CSI4142"."crime_fact" as cf
ON c.crime_key = cf.crime_key
INNER JOIN "CSI4142"."Location" as l
ON l.location_key = cf.location_key
GROUP BY ROLLUP(c.crime_type, l.location_name)
ORDER BY c.crime_type, l.location_name

--Number of crimes grouped by crime category and neighborhood as a group and individual
SELECT c.crime_category, l.neighborhood,
GROUPING(c.crime_category, l.neighborhood), SUM(cf.is_traffic::int)
FROM "CSI4142"."crime" as c 
INNER JOIN "CSI4142"."crime_fact" as cf
ON c.crime_key = cf.crime_key
INNER JOIN "CSI4142"."Location" as l
ON l.location_key = cf.location_key
GROUP BY ROLLUP(c.crime_category, l.neighborhood)
ORDER BY c.crime_category, l.neighborhood

--Slice
--number of crimes that occurred based on type of crime, location name and selected year
SELECT c.crime_type, l.location_name, d.year,count(*)
FROM "CSI4142"."Location" as l 
INNER JOIN "CSI4142"."crime_fact" as cf
ON l.location_key = cf.location_key
INNER JOIN "CSI4142"."crime" as c
ON c.crime_key = cf.crime_key
INNER JOIN "CSI4142"."Date" as d
ON d.date_key = cf.date_key
WHERE d.year = '2020'
GROUP BY crime_type, location_name, year

--number of crimes that occurred based on selected category of crime, selected neighborhood and selected month
SELECT c.crime_category, l.neighborhood, d.month,count(*)
FROM "CSI4142"."Location" as l 
INNER JOIN "CSI4142"."crime_fact" as cf
ON l.location_key = cf.location_key
INNER JOIN "CSI4142"."crime" as c
ON c.crime_key = cf.crime_key
INNER JOIN "CSI4142"."Date" as d
ON d.date_key = cf.date_key
WHERE d.month= '1' OR d.month = '2'
GROUP BY crime_category, neighborhood, month

--Dice
--number of crimes that occurred based on selected type of crime, selected location name and selected year
SELECT c.crime_type, l.location_name, d.year
FROM "CSI4142"."Location" as l 
INNER JOIN "CSI4142"."crime_fact" as cf
ON l.location_key = cf.location_key
INNER JOIN "CSI4142"."crime" as c
ON c.crime_key = cf.crime_key
INNER JOIN "CSI4142"."Date" as d
ON d.date_key = cf.date_key
WHERE d.year = '2015' AND d.year = '2018' AND d.year = '2019' AND d.year = '2020' AND l.location_name = '10700 E DARTMOUTH AVE'  AND l.location_name = '14 W 14TH AVE'  AND l.location_name = '16TH ST / ARAPAHOE ST' AND  c.crime_type ='liquor-possession'  AND c.crime_type ='theft-other' AND c.crime_type ='assault-simple'
GROUP BY crime_type, location_name, year


--Combining OLAP operations.
--levels of crime for different types of crimes and neighborhoods on neighborhood that has a greater than 25 neighborhoodstats.
SELECT c.crime_category, l.city, d.month, c.crime_report_time
FROM "CSI4142"."Location" as l 
INNER JOIN "CSI4142"."crime_fact" as cf
ON l.location_key = cf.location_key
INNER JOIN "CSI4142"."crime" as c
ON c.crime_key = cf.crime_key
INNER JOIN "CSI4142"."Date" as d
ON d.date_key = cf.date_key
WHERE  l.city = 'denver'  AND c.crime_category ='theft-from-motor-vehicle' AND c.crime_category ='larceny' AND c.crime_category ='auto-theft'
GROUP BY crime_category, neighborhood, month

SELECT c.crime_severity_index, l.neighborhood, d.year, l.location_name 
FROM "CSI4142"."Location" as l 
INNER JOIN "CSI4142"."crime_fact" as cf
ON l.location_key = cf.location_key
INNER JOIN "CSI4142"."crime" as c
ON c.crime_key = cf.crime_key
INNER JOIN "CSI4142"."Date" as d
ON d.date_key = cf.date_key
WHERE c.crime_severity_index= 'non-violent' AND d.year= '2016' AND l.neighborhood = 'five-points'  AND l.neighborhood = 'berkeley' AND l.neighborhood = 'capitol-hill' 
GROUP BY c.crime_severity_index, l.neighborhood, d.year, l.location_name 

/*the locations in Denver with the highest occurrences of thefts*/
select crime_category,location_name,COUNT(crime_category) as cum from "CSI4142"."crime_fact" as F
left JOIN "CSI4142"."Location" as D
ON 
F.location_key = D.location_key 
left JOIN "CSI4142"."crime" as C  
ON 
F.crime_key = C.crime_key
WHERE crime_category LIKE '%theft%' and city = 'Denver'
GROUP BY crime_category,location_name
ORDER BY cum DESC
OPTIMIZE FOR 20 ROWS
/*the locations in Denver with the highest occurrences of crimes against a person*/
select crime_category,location_name,COUNT(crime_category) as cum from "CSI4142"."crime_fact" as F
left JOIN "CSI4142"."Location" as D  
ON 
F.location_key = D.location_key 
left JOIN "CSI4142"."crime" as C  
ON 
F.crime_key = C.crime_key
WHERE crime_category LIKE '%crimes-against-person%' and city = 'Denver'
GROUP BY crime_category,location_name
ORDER BY cum DESC
/*show the neighborhoods together with the average number of crimes, per month*/
SELECT neighborhood,EXTRACT(YEAR FROM to_date(D.crime_year,'mm/dd/yyyy')) AS years,EXTRACT(MONTH FROM to_date(D.crime_year,'mm/dd/yyyy')) AS MONTHS,COUNT(neighborhood),ROUND(avg(COUNT(neighborhood)) over (PARTITION BY neighborhood,EXTRACT(YEAR FROM to_date(D.crime_year,'mm/dd/yyyy'))),2)
FROM "CSI4142"."Location" as D 
GROUP BY neighborhood,years,MONTHS
/*show the neighborhoods together with the average number of crimes, per season*/
SELECT neighborhood,EXTRACT(YEAR FROM to_date(D.crime_year,'mm/dd/yyyy')) AS years,EXTRACT(QUARTER FROM to_date(D.crime_year,'mm/dd/yyyy')) AS QUARTER,COUNT(neighborhood),ROUND(avg(COUNT(neighborhood)) over (PARTITION BY neighborhood,EXTRACT(YEAR FROM to_date(D.crime_year,'mm/dd/yyyy'))),2)
FROM "CSI4142"."Location" as D 
GROUP BY neighborhood,years,QUARTER
/*Using the Window clause*/
SELECT neighborhood,EXTRACT(YEAR FROM to_date(D.crime_year,'mm/dd/yyyy')) AS years,EXTRACT(MONTH FROM to_date(D.crime_year,'mm/dd/yyyy')) AS MONTHS,
COUNT(neighborhood),LAG(COUNT(neighborhood),1) OVER W,ROUND(avg(COUNT(neighborhood)) over W,2)
FROM "CSI4142"."Location" as D 
GROUP BY neighborhood,years,MONTHS
Window W AS (PARTITION BY neighborhood,EXTRACT(YEAR FROM to_date(D.crime_year,'mm/dd/yyyy')))