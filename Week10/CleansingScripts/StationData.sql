-- CREATE DATABASE
create database CitiBike_Station;
use CitiBike_Station;

-- CREATE THE TABLE FROM RAWDATA
create external table station_rawdata (id int, station_id int, status string, available_bike_count int, available_dock_count tinyint, created_at Timestamp, station_summary_id int) COMMENT '10min Staion Data from 2013 to 20161031' ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',' STORED AS TEXTFILE
location '/user/chc631/CitiBikeStation';

-- Clean Header Row from CSV
INSERT OVERWRITE TABLE station_rawdata SELECT * FROM station_rawdata where id is not NULL;

-- CREATE THE TABLE FOR TRUNCATED DATA
create external table station_truncsort20151001 (id int, station_id int, status string, available_bike_count int, available_dock_count tinyint, created_at Timestamp, station_summary_id int) COMMENT '10min Staion Data from 20151001 to 20161031' ROW FORMAT DELIMITED FIELDS TERMINATED BY ‘,’;

-- INJECT TRUNCATED AND SORTED DATA INTO NEW TABLE
insert into station_truncsort20151001 select * from station_rawdata where to_date(created_at) >= '2015-10-01' sort by created_at;
