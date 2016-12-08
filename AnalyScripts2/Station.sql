-- Create table for two consequtive timestamp for a station, obtaining the diff between bikes in the 10 min peroid
create table station_diff_all As SELECT id, station_id, created_at as end_time, lag(created_at,1) OVER (ORDER BY id) start_time, available_bike_count - lag(available_bike_count, 1) OVER (ORDER BY station_id, id) delta FROM station_rawdata ;

-- Select 201609 results for testing
insert into station_diff_201609 select * from station_diff_all where to_date(created_at) >= '2015-09-01' and to_date(created_at) <= '2015-09-08' sort by station_id, id;

-- Assuming a delta of larger than five is an event, possible bike rebalancing.
CREATE TABLE IF NOT EXISTS deltaBy5_201609 AS select * from station_diff_201609 where delta>5 order by station_id, id;

-- export table for visualisation on CARTO
insert overwrite local directory '/home/chc631/output/201609_diff' row format delimited fields terminated by ',' select * from deltaBy5_201609;
