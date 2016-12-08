-- Script to create the station geo location table
-- java -jar externals/hive-json-schema/target/json-hive-schema-1.0-jar-with-dependencies.jar datasets/expansion_2016.geojson station_geo

CREATE TABLE station_geo (
  features array<struct<geometry:struct<coordinates:array<double>, type:string>, properties:struct<cartodb_id:int, expansion_status:string, id:string, installed:boolean, latitude:double, longitude:double, name:string, oos:boolean>, type:string>>,
    type string)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe';
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH 'datasets/expansion_2016.geojson' OVERWRITE INTO TABLE  station_geo ;
