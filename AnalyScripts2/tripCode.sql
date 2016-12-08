--create table for bike trip data input

create external table a5 
(tripduration string, starttime string, stoptime string, startStationId string, startStationName string, startStationLa string, startStationLo string, endStationId string, endStationName string, endStationLa string, endStationLo string, bikeId string, usertype string, birthyear string, gender string) 

row format delimited fields terminated by ',' 
location '/user/hpl240/testTime/';

-- given a specific time range, generate the bike input/output number group by station id

--bike output
select startstationid, count(*) from a5 
where unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') > unix_timestamp('2016-09-01 11:00:00') 
AND unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') < unix_timestamp('2016-09-01 11:30:00') 
GROUP BY startstationid;

--bike input
select endstationid, count(*) from a5 
where unix_timestamp(stoptime, 'MM-dd-yyyy HH:mm:ss') > unix_timestamp('2016-09-01 11:00:00') 
AND unix_timestamp(stoptime, 'MM-dd-yyyy HH:mm:ss') < unix_timestamp('2016-09-01 11:30:00') 
GROUP BY endstationid;

-- create output data table   
create table station_output
AS SELECT startstationid AS station_id, starttime, -1 AS station_flow  FROM a5

-- create input data table    
create table station_input
AS SELECT endstationid AS station_id, stoptime, 1 AS station_flow  FROM a5

-- create station outflow table
select station_id, count(*) AS out_flow from station_output
GROUP BY station_id;

-- create station inflow table
select station_id, count(*) AS in_flow from station_intput
GROUP BY station_id;