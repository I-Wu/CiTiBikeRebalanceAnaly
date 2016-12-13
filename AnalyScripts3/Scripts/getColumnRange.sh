beeline -u jdbc:hive2://babar.es.its.nyu.edu:10000/CitiBike_Station -n chc631 \
-e \
"SELECT *
FROM
 (SELECT *,
         rank() over (order by station_id desc) as r 
  FROM station_rawdata) S
WHERE S.r = 1;"
