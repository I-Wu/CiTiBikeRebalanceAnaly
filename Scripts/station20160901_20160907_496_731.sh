TABLE_NAME=rrrr_2
beeline -u jdbc:hive2://babar.es.its.nyu.edu:10000/CitiBike_Station -n chc631 -e " CREATE TABLE $TABLE_NAME AS SELECT id, station_summary_id, station_id, lag(created_at,1) OVER (ORDER BY id,station_summary_id) start_time, created_at as end_time, available_bike_count - lag(available_bike_count, 1) OVER (ORDER BY station_id, station_summary_id) delta FROM station_rawdata where to_date(created_at) >= '2016-09-01' and to_date(created_at) < '2016-09-08' and station_id=496 order by station_id, station_summary_id";

for flag in {497..731}; do
(beeline -u jdbc:hive2://babar.es.its.nyu.edu:10000/CitiBike_Station -n chc631 -e "insert into $TABLE_NAME SELECT id, station_summary_id, station_id, lag(created_at,1) OVER (ORDER BY id,station_summary_id) start_time, created_at as end_time, available_bike_count - lag(available_bike_count, 1) OVER (ORDER BY station_id, station_summary_id) delta FROM station_rawdata where to_date(created_at) >= '2016-09-01' and to_date(created_at) < '2016-09-08' and station_id=$flag order by station_id, station_summary_id")
done
