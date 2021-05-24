--script to build the mart


ALTER TABLE "CSI4142"."CRIMETABLE"
    OWNER to dlian052;
-- Table: "CSI4142"."Date"

-- DROP TABLE "CSI4142"."Date";

CREATE TABLE "CSI4142"."Date"
(
    date_key character(100) COLLATE pg_catalog."default" NOT NULL,
    date_of_week character(100) COLLATE pg_catalog."default",
    year character(100) COLLATE pg_catalog."default",
    month character(100) COLLATE pg_catalog."default",
    weekend boolean,
    holiday boolean,
    holiday_name character(100) COLLATE pg_catalog."default",
    day character(100) COLLATE pg_catalog."default",
    CONSTRAINT "Date_pkey" PRIMARY KEY (date_key)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "CSI4142"."Date"
    OWNER to dlian052;
-- Table: "CSI4142"."Location"

-- DROP TABLE "CSI4142"."Location";

CREATE TABLE "CSI4142"."Date"
(
    date_key serial NOT NULL,
    date_of_week character(100),
    month integer,
    year integer,
    weekend boolean,
    holiday boolean,
    holiday_name character(100),
 PRIMARY KEY (date_key)
)

-- Table: "CSI4142".crime

-- DROP TABLE "CSI4142".crime;

CREATE TABLE "CSI4142".crime
(
    crime_key serial NOT NULL,
    crime_report_time character(100) COLLATE pg_catalog."default",
    crime_start_time character(100) COLLATE pg_catalog."default",
    crime_end_time character(100) COLLATE pg_catalog."default",
    crime_detail character(100) COLLATE pg_catalog."default",
    crime_type character(100) COLLATE pg_catalog."default",
    crime_category character(100) COLLATE pg_catalog."default",
    crime_severity_index character(100) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "CSI4142".crime
    OWNER to dlian052;

-- Table: "CSI4142".event

-- DROP TABLE "CSI4142".event;

CREATE TABLE "CSI4142".event
(
    event_key serial NOT NULL,
    event_name character(100) COLLATE pg_catalog."default",
    start_date character(100) COLLATE pg_catalog."default",
    end_date character(100) COLLATE pg_catalog."default",
    event_location character(100) COLLATE pg_catalog."default",
    event_type character(100) COLLATE pg_catalog."default",
    event_location_size real
    
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;
ALTER TABLE "CSI4142".event
    OWNER to dlian052;
--
-- Table: "CSI4142"."Location"

-- DROP TABLE "CSI4142"."Location";

CREATE TABLE "CSI4142"."Location"
(
    location_key serial NOT NULL,
    location_name character(100) COLLATE pg_catalog."default",
    longitude character(100) COLLATE pg_catalog."default",
    latitude character(100) COLLATE pg_catalog."default",
    neighborhood character(100) COLLATE pg_catalog."default",
    neighborhoodstats character(100) COLLATE pg_catalog."default",
    city character(100) COLLATE pg_catalog."default",
    crime_rate character(100) COLLATE pg_catalog."default",
	crime_year character(100) COLLATE pg_catalog."default"
    
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "CSI4142"."Location"
OWNER to dlian052;
-- Table: "CSI4142"."Denver"

-- DROP TABLE "CSI4142"."Denver";

CREATE TABLE "CSI4142"."Denver"
(
    incident_id character(100) COLLATE pg_catalog."default",
    offense_id character(100) COLLATE pg_catalog."default",
    offense_code integer,
    offense_code_extension integer,
    offense_type_id character(100) COLLATE pg_catalog."default",
    offense_category_id character(100) COLLATE pg_catalog."default",
    first_occurrence_date character(100) COLLATE pg_catalog."default",
    last_occurrence_date character(100) COLLATE pg_catalog."default",
    reported_date character(100) COLLATE pg_catalog."default",
    incident_address character(100) COLLATE pg_catalog."default",
    geo_x character(100) COLLATE pg_catalog."default",
    geo_y character(100) COLLATE pg_catalog."default",
    geo_lon character(100) COLLATE pg_catalog."default",
    geo_lat character(100) COLLATE pg_catalog."default",
    district_id integer,
    precinct_id integer,
    neighborhood_id character(100) COLLATE pg_catalog."default",
    is_crime boolean,
    is_traffic boolean,
    series character(100) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "CSI4142"."Denver"
    OWNER to dlian052;

-- Table: "CSI4142"."Vancouver"

-- DROP TABLE "CSI4142"."Vancouver";

CREATE TABLE "CSI4142"."Vancouver"
(
    crime_type character(100) COLLATE pg_catalog."default",
    crime_year integer,
    crime_month integer,
    crime_day integer,
    crime_hour integer,
    crime_minute integer,
    location_name character(100) COLLATE pg_catalog."default",
    neighborhood character(100) COLLATE pg_catalog."default",
    longitude character(100) COLLATE pg_catalog."default",
    latitude character(100) COLLATE pg_catalog."default",
    reported_date character(100) COLLATE pg_catalog."default",
    start_date character(100) COLLATE pg_catalog."default",
    end_date character(100) COLLATE pg_catalog."default",
    crime_detail character(100) COLLATE pg_catalog."default",
    crime_category character(100) COLLATE pg_catalog."default",
    crime_severity_index character(100) COLLATE pg_catalog."default",
    series character(100) COLLATE pg_catalog."default",
    city character(100) COLLATE pg_catalog."default",
    neighborhood_stats character(100) COLLATE pg_catalog."default",
    is_crime boolean,
    is_traffic boolean,
    crime_rate character(100) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "CSI4142"."Vancouver"
    OWNER to dlian052;



CREATE TABLE "CSI4142"."Date_test"
(
    date_of_week character(100) COLLATE pg_catalog."default",
    year character(100) COLLATE pg_catalog."default",
    month character(100) COLLATE pg_catalog."default",
	day character(100) COLLATE pg_catalog."default",
    weekend boolean,
    holiday boolean,
    holiday_name character(100) COLLATE pg_catalog."default",
    date character(100) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "CSI4142"."Date_test"
    OWNER to dlian052;



-- Table: "CSI4142"."Date"

-- DROP TABLE "CSI4142"."Date";

CREATE TABLE "CSI4142"."Date"
(
    date_key serial NOT NULL,
    date_of_week character(100) COLLATE pg_catalog."default",
    year character(100) COLLATE pg_catalog."default",
    month character(100) COLLATE pg_catalog."default",
	day character(100) COLLATE pg_catalog."default",
    weekend boolean,
    holiday boolean,
    holiday_name character(100) COLLATE pg_catalog."default",
    date character(100) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "CSI4142"."Date"
    OWNER to dlian052;