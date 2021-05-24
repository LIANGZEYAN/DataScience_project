SELECT l.location_name,count(*) 
FROM "CSI4142"."Location" as l INNER JOIN "CSI4142"."crime_fact" as c
ON l.location_key = c.location_key
GROUP BY location_name

//Drill Down
//Query result: Number of crimes that occurred on 10700 E DARTMOUTH AVE before 12.30.2018 per type of impact
SELECT c.crime_type,count(*)
FROM "CSI4142"."Location" as l 
INNER JOIN "CSI4142"."crime_fact" as cf
ON l.location_key = cf.location_key
INNER JOIN "CSI4142"."crime" as c
ON c.crime_key = cf.crime_key
WHERE location_name = '10700 E DARTMOUTH AVE' AND l.crime_year <='12.30.2018 00:00:00'
GROUP BY crime_type

//Query result: Number of non-violent crimes that occurred on neighborhood that has a greater than 25  neighborhoodstats after '01.01.2010  per type of impact
SELECT c.crime_type,count(*)
FROM "CSI4142"."Location" as l 
INNER JOIN "CSI4142"."crime_fact" as cf
ON l.location_key = cf.location_key
INNER JOIN "CSI4142"."crime" as c
ON c.crime_key = cf.crime_key
WHERE l.neighborhoodstats::int >= 25 AND l.crime_year >='01.01.2010 00:00:00' AND c.crime_severity_index = 'non-violent'
GROUP BY crime_type

//Roll Up
//Number of crimes grouped by crime type and location name as a group and individual
SELECT c.crime_type, l.location_name,
GROUPING(c.crime_type, l.location_name), SUM(cf.is_fatal::int)
FROM "CSI4142"."crime" as c 
INNER JOIN "CSI4142"."crime_fact" as cf
ON c.crime_key = cf.crime_key
INNER JOIN "CSI4142"."Location" as l
ON l.location_key = cf.location_key
GROUP BY ROLLUP(c.crime_type, l.location_name)
ORDER BY c.crime_type, l.location_name

//Number of crimes grouped by crime category and neighborhood as a group and individual
SELECT c.crime_category, l.neighborhood,
GROUPING(c.crime_category, l.neighborhood), SUM(cf.is_traffic::int)
FROM "CSI4142"."crime" as c 
INNER JOIN "CSI4142"."crime_fact" as cf
ON c.crime_key = cf.crime_key
INNER JOIN "CSI4142"."Location" as l
ON l.location_key = cf.location_key
GROUP BY ROLLUP(c.crime_category, l.neighborhood)
ORDER BY c.crime_category, l.neighborhood