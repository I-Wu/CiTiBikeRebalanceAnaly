--create table for bike trip data input

create external table a5 
(tripduration string, starttime string, stoptime string, startStationId string, startStationName string, startStationLa string, startStationLo string, endStationId string, endStationName string, endStationLa string, endStationLo string, bikeId string, usertype string, birthyear string, gender string) 

row format delimited fields terminated by ',' 
location '/user/hpl240/testTime/';

-- given a specific time range, generate the bike input/output number group by station id

--bike output
select endstationid, count(*) from a5 
where unix_timestamp(starttime, 'M-d-yyyy HH:mm:ss') > unix_timestamp('2016-09-01 11:00:00') 
AND unix_timestamp(starttime, 'M-d-yyyy HH:mm:ss') < unix_timestamp('2016-09-01 11:30:00') 
GROUP BY startstationid;

--bike input
select endstationid, count(*) from a5 
where unix_timestamp(endtime, 'M-d-yyyy HH:mm:ss') > unix_timestamp('2016-09-01 11:00:00') 
AND unix_timestamp(endtime, 'M-d-yyyy HH:mm:ss') < unix_timestamp('2016-09-01 11:30:00') 
GROUP BY endstationid;
