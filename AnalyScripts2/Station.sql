-- Create table for two consequtive timestamp for a station, obtaining the diff between bikes in the 10 min peroid
create table station_diff_all As SELECT id, station_id, created_at as end_time, lag(created_at,1) OVER (ORDER BY id) start_time, available_bike_count - lag(available_bike_count, 1) OVER (ORDER BY station_id, id) delta FROM station_rawdata ;

-- Select 201609 results for testing
CREATE TABLE station_diff_201609 AS select * from station_diff_all where to_date(start_time) >= '2016-09-01' and to_date(start_time) < '2016-10-01' sort by station_id, id;

-- Assuming a delta of larger than five is an event, possible bike rebalancing.
CREATE TABLE IF NOT EXISTS deltaBy5_201609 AS select * from station_diff_201609 where delta>5 order by station_id, id;

-- export table for visualisation on CARTO
insert overwrite directory '/user/chc631/output2/deltaby5_201509' row format delimited fields terminated by ',' select * from deltaby5_201509;
