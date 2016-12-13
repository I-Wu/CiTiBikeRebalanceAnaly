-- Script to create the station geo location table
-- java -jar externals/hive-json-schema/target/json-hive-schema-1.0-jar-with-dependencies.jar datasets/expansion_2016.geojson station_geo

-- This is a local path
add jar /home/chc631/CiTiBikeRebalanceAnaly/externals/json-serde-1.3.7-jar-with-dependencies.jar;

CREATE TABLE station_geo2 (
  cartodb_id int,
  expansion_status string,
  id string,
  installed boolean,
  latitude double,
  longitude double,
  name string,
  oos boolean)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '/home/chc631/CiTiBikeRebalanceAnaly/datasets/expansion_2016_formated2.geojson' OVERWRITE INTO TABLE  station_geo2 ;
create table station_geo as select * from station_geo2;
select * from station_geo limit 10;
