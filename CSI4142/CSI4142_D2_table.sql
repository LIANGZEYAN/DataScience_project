--insert denver crime data in to table crime
INSERT INTO "CSI4142".crime(crime_report_time,crime_start_time,crime_end_time,crime_detail,crime_type,crime_category)
SELECT 
     reported_date,first_occurrence_date,last_occurrence_date,offense_type_id,offense_type_id,offense_category_id
FROM 
     "CSI4142"."Denver"

--select all crime type in denver
SELECT distinct crime_type FROM "CSI4142".crime where "CSI4142".crime.crime_category = 'all-other-crimes';




-- update crime_severity_index by different type for denver
UPDATE "CSI4142".crime SET crime_severity_index= 'non-violent' WHERE crime_category = 'larceny';
UPDATE "CSI4142".crime SET crime_severity_index= 'non-violent' WHERE crime_category = 'auto-theft';
UPDATE "CSI4142".crime SET crime_severity_index= 'non-violent' WHERE crime_category = 'burglary';
UPDATE "CSI4142".crime SET crime_severity_index= 'non-violent' WHERE crime_category = 'theft-from-motor-vehicle';
UPDATE "CSI4142".crime SET crime_severity_index= 'non-violent' WHERE crime_category = 'drug-alcohol';
UPDATE "CSI4142".crime SET crime_severity_index= 'non-violent' WHERE crime_category = 'traffic-accident';
UPDATE "CSI4142".crime SET crime_severity_index= 'non-violent' WHERE crime_category = 'white-collar-crime';
UPDATE "CSI4142".crime SET crime_severity_index= 'violent' WHERE crime_category = 'other-crimes-against-persons';
UPDATE "CSI4142".crime SET crime_severity_index= 'violent' WHERE crime_category = 'aggravated-assault';
UPDATE "CSI4142".crime SET crime_severity_index= 'violent' WHERE crime_category = 'sexual-assault';
UPDATE "CSI4142".crime SET crime_severity_index= 'violent' WHERE crime_category = 'murder';
UPDATE "CSI4142".crime SET crime_severity_index= 'violent' WHERE crime_category = 'arson';
UPDATE "CSI4142".crime SET crime_severity_index= 'violent' WHERE crime_category = 'robbery';
UPDATE "CSI4142".crime SET crime_severity_index= 'violent' WHERE crime_category = 'public-disorder';
UPDATE "CSI4142".crime SET crime_severity_index= 'violent/non-violent' WHERE crime_category = 'all-other-crimes';


--Insert location data into table location included surrogate key series
INSERT INTO "CSI4142"."Location"(location_name,longitude,latitude,neighborhood,crime_year)
SELECT 
     distinct on (incident_address,geo_lon, geo_lat) incident_address, geo_lon, geo_lat, neighborhood_id, reported_date
FROM 
     "CSI4142"."Denver"

--Update the neighborhoodstats,city and crime_rate date for denver in table location
UPDATE "CSI4142"."Location" SET neighborhoodstats = floor(random()*101);
----------------------
UPDATE "CSI4142"."Location" SET city = 'Denver';
UPDATE "CSI4142"."Location" SET crime_rate = '0.6';

--insert vancouver crime data in to table crime
INSERT INTO "CSI4142".crime(crime_report_time,crime_start_time,crime_end_time,crime_detail,crime_type,crime_category)
SELECT 
     reported_date,start_date,end_date,crime_detail,crime_type,crime_category
FROM 
     "CSI4142"."Vancouver"

--insert into event
INSERT INTO "CSI4142"."event"(event_name,start_date,end_date,event_location,event_type,event_location_size)
SELECT 
     distinct event_name,start_date,end_date,event_location,event_type,event_location_size
FROM 
     "CSI4142"."event_test"

--Insert location data into table location included surrogate key series
INSERT INTO "CSI4142"."Location"(location_name,longitude,latitude,neighborhood,city,crime_year)
SELECT 
     distinct (location_name,longitude,latitude)location_name,longitude,latitude,neighborhood,city,crime_year
FROM 
     "CSI4142"."Vancouver"
--update every year crime rate in Vancouver data from(https://vancouver.ca/police/organization/planning-research-audit/stats-crime-rate.html)
UPDATE "CSI4142"."Location" SET crime_rate = '66.90' WHERE crime_year = '2014' AND city='Vancouver';
UPDATE "CSI4142"."Location" SET crime_rate = '74.7' WHERE crime_year = '2013'AND city='Vancouver';
UPDATE "CSI4142"."Location" SET crime_rate = '117.3' WHERE crime_year = '2003'AND city='Vancouver';
UPDATE "CSI4142"."Location" SET crime_rate = '90.1' WHERE crime_year = '2008'AND city='Vancouver';
UPDATE "CSI4142"."Location" SET crime_rate = '74.29' WHERE crime_year = '2015'AND city='Vancouver';
UPDATE "CSI4142"."Location" SET crime_rate = '77.6' WHERE crime_year = '2010'AND city='Vancouver';
UPDATE "CSI4142"."Location" SET crime_rate = '95.3' WHERE crime_year = '2007'AND city='Vancouver';
UPDATE "CSI4142"."Location" SET crime_rate = '82.82' WHERE crime_year = '2019'AND city='Vancouver';
UPDATE "CSI4142"."Location" SET crime_rate = '118.5' WHERE crime_year = '2004'AND city='Vancouver';
UPDATE "CSI4142"."Location" SET crime_rate = '107' WHERE crime_year = '2006'AND city='Vancouver';
UPDATE "CSI4142"."Location" SET crime_rate = '75' WHERE crime_year = '2020'AND city='Vancouver';
UPDATE "CSI4142"."Location" SET crime_rate = '75.8' WHERE crime_year = '2011'AND city='Vancouver';
UPDATE "CSI4142"."Location" SET crime_rate = '78.13' WHERE crime_year = '2017'AND city='Vancouver';
UPDATE "CSI4142"."Location" SET crime_rate = '79.30' WHERE crime_year = '2016'AND city='Vancouver';
UPDATE "CSI4142"."Location" SET crime_rate = '7406' WHERE crime_year = '2012'AND city='Vancouver';
UPDATE "CSI4142"."Location" SET crime_rate = '83.1' WHERE crime_year = '2009'AND city='Vancouver';
UPDATE "CSI4142"."Location" SET crime_rate = '78.78' WHERE crime_year = '2018'AND city='Vancouver';
UPDATE "CSI4142"."Location" SET crime_rate = '108.5' WHERE crime_year = '2005'AND city='Vancouver';
UPDATE "CSI4142"."Location" SET neighborhoodstats = floor(random()*101);
--update crime_severity_index in Vancouver
UPDATE "CSI4142".crime SET crime_severity_index= 'violent' WHERE crime_category = 'Break and Enter Residential/Other';
UPDATE "CSI4142".crime SET crime_severity_index= 'non-violent' WHERE crime_category = 'Theft of Vehicle';
UPDATE "CSI4142".crime SET crime_severity_index= 'violent' WHERE crime_category = 'Offence Against a Person';
UPDATE "CSI4142".crime SET crime_severity_index= 'non-violent' WHERE crime_category = 'Vehicle Collision or Pedestrian Struck (with Fatality)';
UPDATE "CSI4142".crime SET crime_severity_index= 'non-violent' WHERE crime_category = 'Theft of Bicycle';
UPDATE "CSI4142".crime SET crime_severity_index= 'non-violent' WHERE crime_category = 'Theft from Vehicle';
UPDATE "CSI4142".crime SET crime_severity_index= 'violent' WHERE crime_category = 'Mischief';                                                                                        
UPDATE "CSI4142".crime SET crime_severity_index= 'non-violent' WHERE crime_category = 'Other Theft';
UPDATE "CSI4142".crime SET crime_severity_index= 'violent' WHERE crime_category = 'Vehicle Collision or Pedestrian Struck (with Injury)';
UPDATE "CSI4142".crime SET crime_severity_index= 'violent' WHERE crime_category = 'Homicide';
UPDATE "CSI4142".crime SET crime_severity_index= 'violent' WHERE crime_category = 'Break and Enter Commercial';
--update is_traffic by different crime type in Vancouver
UPDATE "CSI4142"."Vancouver" SET is_traffic= '0' WHERE crime_category = 'Break and Enter Residential/Other';
UPDATE "CSI4142"."Vancouver" SET is_traffic= '1' WHERE crime_category = 'Theft of Vehicle';
UPDATE "CSI4142"."Vancouver" SET is_traffic= '0' WHERE crime_category = 'Offence Against a Person';
UPDATE "CSI4142"."Vancouver" SET is_traffic= '1' WHERE crime_category = 'Vehicle Collision or Pedestrian Struck (with Fatality)';
UPDATE "CSI4142"."Vancouver" SET is_traffic= '1' WHERE crime_category = 'Theft of Bicycle';
UPDATE "CSI4142"."Vancouver" SET is_traffic= '1' WHERE crime_category = 'Theft from Vehicle';
UPDATE "CSI4142"."Vancouver" SET is_traffic= '0' WHERE crime_category = 'Mischief';                                                                                        
UPDATE "CSI4142"."Vancouver" SET is_traffic= '0' WHERE crime_category = 'Other Theft';
UPDATE "CSI4142"."Vancouver" SET is_traffic= '1' WHERE crime_category = 'Vehicle Collision or Pedestrian Struck (with Injury)';
UPDATE "CSI4142"."Vancouver" SET is_traffic= '0' WHERE crime_category = 'Homicide';
UPDATE "CSI4142"."Vancouver" SET is_traffic= '0' WHERE crime_category = 'Break and Enter Commercial';
--update is_fatal by different crime type in Vancouver

UPDATE "CSI4142"."Vancouver" SET is_crime= '1' WHERE crime_category = 'Break and Enter Residential/Other';
UPDATE "CSI4142"."Vancouver" SET is_crime= '0' WHERE crime_category = 'Theft of Vehicle';
UPDATE "CSI4142"."Vancouver" SET is_crime= '1' WHERE crime_category = 'Offence Against a Person';
UPDATE "CSI4142"."Vancouver" SET is_crime= '1' WHERE crime_category = 'Vehicle Collision or Pedestrian Struck (with Fatality)';
UPDATE "CSI4142"."Vancouver" SET is_crime= '0' WHERE crime_category = 'Theft of Bicycle';
UPDATE "CSI4142"."Vancouver" SET is_crime= '0' WHERE crime_category = 'Theft from Vehicle';
UPDATE "CSI4142"."Vancouver" SET is_crime= '1' WHERE crime_category = 'Mischief';                                                                                        
UPDATE "CSI4142"."Vancouver" SET is_crime= '0' WHERE crime_category = 'Other Theft';
UPDATE "CSI4142"."Vancouver" SET is_crime= '1' WHERE crime_category = 'Vehicle Collision or Pedestrian Struck (with Injury)';
UPDATE "CSI4142"."Vancouver" SET is_crime= '1' WHERE crime_category = 'Homicide';
UPDATE "CSI4142"."Vancouver" SET is_crime= '0' WHERE crime_category = 'Break and Enter Commercial';

--for event part, insert the UTF8 csv file that build by ourselves(More than 200 different events and holidays in denver and vancouver)
--left join code for creating the crime_fact_table

ALTER TABLE "CSI4142"."Denver" 
ADD is_nighttime bool;

UPDATE "CSI4142"."Denver"  SET is_nighttime= '0';
UPDATE "CSI4142"."Denver" SET is_nighttime= '1' WHERE extract(hour from to_timestamp(reported_date,'mm/dd/yyyy hh12:mi:ss am')) >20 or extract(hour from to_timestamp(reported_date,'mm/dd/yyyy hh12:mi:ss am'))<6;

insert into "CSI4142"."crime_fact" (crime_key,location_key,is_traffic,is_Fatal,is_nighttime)
SELECT crime_key,location_key, IS_TRAFFIC,IS_CRIME,is_nighttime
FROM "CSI4142"."Denver" 
left JOIN "CSI4142"."Location" 
ON 
"CSI4142"."Location".location_name = "CSI4142"."Denver".INCIDENT_ADDRESS 
and 
"CSI4142"."Location".neighborhood = "CSI4142"."Denver".NEIGHBORHOOD_ID
and 
"CSI4142"."Location".Longitude = TO_NUMBER("CSI4142"."Denver".GEO_LON,'999999999D999999999')
and 
"CSI4142"."Location".Latitude = TO_NUMBER("CSI4142"."Denver".GEO_LAT,'999999999D999999999')
left JOIN "CSI4142"."crime" 
ON 
"CSI4142"."crime".crime_report_time =  to_date("CSI4142"."Denver".reported_date,'mm/dd/yyyy')
and 
"CSI4142"."crime".crime_start_time = to_date("CSI4142"."Denver".first_occurrence_date,'mm/dd/yyyy')
and 
"CSI4142"."crime".crime_end_time = to_date("CSI4142"."Denver".last_occurrence_date,'mm/dd/yyyy')
and 
"CSI4142"."crime".crime_detail = "CSI4142"."Denver".offense_type_id
and 
"CSI4142"."crime".crime_category = "CSI4142"."Denver".offense_category_id
order by INCIDENT_ID