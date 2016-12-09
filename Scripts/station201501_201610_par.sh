USERNAME=$1
START_ID=650
END_ID=715
TABLE_NAME=par_station_diff_201501_201610_$START_ID_$END_ID
NEXT_ID=$(($START_ID+1))

beeline -u jdbc:hive2://babar.es.its.nyu.edu:10000/CitiBike_Station -n $USERNAME -e " CREATE TABLE $TABLE_NAME AS SELECT id, station_summary_id, station_id, lag(created_at,1) OVER (ORDER BY id,station_summary_id) start_time, created_at as end_time, available_bike_count - lag(available_bike_count, 1) OVER (ORDER BY station_id, station_summary_id) delta FROM station_rawdata where to_date(created_at) >= '2015-01-01' and to_date(created_at) < '2016-11-01' and station_id=$START_ID order by station_id, station_summary_id";

for flag in $(seq $NEXT_ID $END_ID); do
(beeline -u jdbc:hive2://babar.es.its.nyu.edu:10000/CitiBike_Station -n $USERNAME -e "insert into $TABLE_NAME SELECT id, station_summary_id, station_id, lag(created_at,1) OVER (ORDER BY id,station_summary_id) start_time, created_at as end_time, available_bike_count - lag(available_bike_count, 1) OVER (ORDER BY station_id, station_summary_id) delta FROM station_rawdata where to_date(created_at) >= '2015-01-01' and to_date(created_at) < '2016-11-01' and station_id=$flag order by station_id, station_summary_id") &
done
wait
