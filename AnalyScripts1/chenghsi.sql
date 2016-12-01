CREATE temporary TABLE IF NOT EXISTS station236_temp AS select * from station_truncsort20160901_0907;

SELECT
  id, station_id, created_at,
  available_bike_count - lag(available_bike_count, 1) OVER (ORDER BY id) delta
FROM station_truncsort20160901_0907
WHERE station_id=236 ORDER BY id ;
