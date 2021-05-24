/*the locations in Denver with the highest occurrences of thefts*/
select location_name,COUNT(crime_category) as cum from "CSI4142"."crime_fact" as F
left JOIN "CSI4142"."Location" as D  
ON 
F.location_key = D.location_key 
left JOIN "CSI4142"."crime" as C  
ON 
F.crime_key = C.crime_key
WHERE crime_category LIKE '%theft%' and city = 'Denver'
GROUP BY location_name
ORDER BY cum DESC
/*the locations in Denver with the highest occurrences of crimes against a person*/
select location_name,COUNT(crime_category) as cum from "CSI4142"."crime_fact" as F
left JOIN "CSI4142"."Location" as D  
ON 
F.location_key = D.location_key 
left JOIN "CSI4142"."crime" as C  
ON 
F.crime_key = C.crime_key
WHERE crime_category LIKE '%crimes-against-person%' and city = 'Denver'
GROUP BY location_name
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