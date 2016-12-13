USERNAME=chc631
START_ID=$1
# END_ID=$2
TABLE_NAME=station_diff_201509_201610_$START_ID\_$END_ID
# NEXT_ID=$(($START_ID+1))

beeline -u jdbc:hive2://babar.es.its.nyu.edu:10000/CitiBike_Station2 -n $USERNAME -e " CREATE TABLE $TABLE_NAME AS SELECT dock_id, dock_name, lag(created_at,1) OVER (ORDER BY dock_id,created_at) start_time, created_at as end_time, avail_bikes - lag(avail_bikes, 1) OVER (ORDER BY dock_id, created_at) delta FROM $TABLE_NAME and dock_id=$START_ID order by dock_id, created_at";

for flag in $(seq $NEXT_ID $END_ID); do
(beeline -u jdbc:hive2://babar.es.its.nyu.edu:10000/CitiBike_Station2 -n $USERNAME -e "insert into $TABLE_NAME SELECT dock_id, dock_name, lag(created_at,1) OVER (ORDER BY dock_id, created_at) start_time, created_at as end_time, avail_bikes - lag(avail_bikes, 1) OVER (ORDER BY dock_id, created_at) delta FROM $TABLE_NAME where to_date(created_at) >= '2015-01-01' and to_date(created_at) < '2016-11-01' order by dock_id, created_at") 
done
