TABLE=par_station_diff_201501_201610_715
# TABLE=par_station_diff_201501_201610_1
# TABLE=real01_07
beeline -u jdbc:hive2://babar.es.its.nyu.edu:10000/CitiBike_Station -n chc631 \
-e \
"SELECT * 
FROM
  (SELECT count(id), station_id
  FROM $TABLE
  group by station_id
  ORDER BY station_id
  ) S
;"

# WHERE to_date(start_time) >= '2015-01-01' and to_date(start_time) < '2016-11-01'
# WHERE S.station_id >= 1 and S.station_id <=30
