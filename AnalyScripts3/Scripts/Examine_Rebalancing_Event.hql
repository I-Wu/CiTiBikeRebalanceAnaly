-- Examine Rebalancing Event

-- Set reducer number as 1
-- set hive.exec.reducers.max=1;


-- --join the table of bike trip information and the table of bike station information for output number
-- create table station_outtrip_timeperiod
-- AS SELECT Trip1015_0916.startstationid, Trip1015_0916.starttime, 
-- station_diff_201510_201609_service_nonull_nodup.start_time, 
-- station_diff_201510_201609_service_nonull_nodup.end_time, 
-- station_diff_201510_201609_service_nonull_nodup.dock_id, 
-- station_diff_201510_201609_service_nonull_nodup.bike_delta
-- FROM station_diff_201510_201609_service_nonull_nodup
-- JOIN Trip1015_0916
-- WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN  start_time AND end_time 
-- AND startstationid == dock_id
-- ORDER BY dock_id, start_time;
-- 
-- 
-- --join the table of bike trip information and the table of bike station information for input number
-- create table station_intrip_timeperiod
-- AS SELECT Trip1015_0916.endstationid, Trip1015_0916.stoptime, 
-- station_diff_201510_201609_service_nonull_nodup.start_time, 
-- station_diff_201510_201609_service_nonull_nodup.end_time, 
-- station_diff_201510_201609_service_nonull_nodup.dock_id, 
-- station_diff_201510_201609_service_nonull_nodup.bike_delta
-- FROM station_diff_201510_201609_service_nonull_nodup
-- JOIN Trip1015_0916
-- WHERE unix_timestamp(stoptime, 'MM-dd-yyyy HH:mm:ss') BETWEEN  start_time AND end_time 
-- AND endstationid == dock_id
-- ORDER BY dock_id, start_time;


-- trip table for only 201609   
CREATE TABLE trip_09
AS SELECT *
FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN  unix_timestamp('2016-09-01 00:00:00') AND unix_timestamp('2016-09-30 23:59:59')
ORDER BY unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss');

-- station table for only 201609
CREATE TABLE station_09
AS SELECT *
FROM station_diff_201510_201609_service_nonull_nodup
WHERE unix_timestamp(start_time, 'MM-dd-yyyy HH:mm:ss') BETWEEN  unix_timestamp('2016-09-01 00:00:00') AND unix_timestamp('2016-09-30 23:59:59')
ORDER BY unix_timestamp(start_time, 'MM-dd-yyyy HH:mm:ss');

-- Try to calculat bike_delta using Sep. data only
-- join trip and station table by each station id and time period for output trips
create table station_outtrip09_timeperiod_1
AS SELECT trip_09.startstationid, trip_09.starttime, 
station_09.start_time, 
station_09.end_time, 
station_09.dock_id, 
station_09.bike_delta
FROM station_09
JOIN trip_09
WHERE ((unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN  start_time AND end_time) 
AND (startstationid == dock_id))
ORDER BY dock_id, start_time;

-- group the station with trip output count in each time period
create table outtrip09_timeperiod_count
AS SELECT
station_outtrip09_timeperiod_1.dock_id,  
station_outtrip09_timeperiod_1.start_time,
station_outtrip09_timeperiod_1.end_time, 
count(*) as outflow, 
station_outtrip09_timeperiod_1.bike_delta as station_bike_delta
FROM station_outtrip09_timeperiod_1
GROUP BY dock_id, start_time, end_time, bike_delta;

-- join trip and station table by each station id and time period for input trips
create table station_intrip09_timeperiod
AS SELECT trip_09.endstationid, trip_09.stoptime, 
station_09.start_time, 
station_09.end_time, 
station_09.dock_id, 
station_09.bike_delta
FROM station_09
JOIN trip_09
WHERE ((unix_timestamp(stoptime, 'MM-dd-yyyy HH:mm:ss') BETWEEN  start_time AND end_time) 
AND (endstationid == dock_id))
ORDER BY dock_id, start_time;

-- group the station with trip input count in each time period
create table intrip09_timeperiod_count
AS SELECT
station_intrip09_timeperiod.dock_id,  
station_intrip09_timeperiod.start_time,
station_intrip09_timeperiod.end_time, 
count(*) as inflow, 
station_intrip09_timeperiod.bike_delta as station_bike_delta
FROM station_intrip09_timeperiod
GROUP BY dock_id, start_time, end_time, bike_delta;

-----------------------------------

--Compute the bike_delta of (inflow- outflow) from trip data and match with the bike_delta from station data
create table intrip09_tripbike_delta_v2
AS SELECT
intrip09_timeperiod_count.dock_id as in_dock_id,  
intrip09_timeperiod_count.start_time as in_start_time,
intrip09_timeperiod_count.end_time as in_end_time,
intrip09_timeperiod_count.inflow,
outtrip09_timeperiod_count.dock_id as out_dock_id,  
outtrip09_timeperiod_count.start_time as out_start_time,
outtrip09_timeperiod_count.end_time as out_end_time,
outtrip09_timeperiod_count.outflow,
outtrip09_timeperiod_count.station_bike_delta,
(intrip09_timeperiod_count.inflow - outtrip09_timeperiod_count.outflow) as trip_bike_delta
FROM outtrip09_timeperiod_count
JOIN intrip09_timeperiod_count
WHERE intrip09_timeperiod_count.dock_id == outtrip09_timeperiod_count.dock_id
AND intrip09_timeperiod_count.start_time == outtrip09_timeperiod_count.start_time
ORDER BY in_dock_id, in_start_time;



-- ------------------------------------------------
-- --Examine the bike_delta matching 
-- 
-- select count (*) from intrip09_tripbike_delta_v2 WHERE (station_bike_delta - trip_bike_delta == 0);
-- >  21679 
-- select count (*) from intrip09_tripbike_delta_v2;
-- > 130776
-- 
-- select in_dock_id, in_start_time, in_end_time from intrip09_tripbike_delta_v2 WHERE (abs(station_bike_delta - trip_bike_delta) >= 5) limit 50;
-- 
