CREATE TABLE station_rawdata_acid (
dock_id int, 
dock_name string,
created_at timestamp,
avail_bikes int,    
avail_docks int,     
tot_docks int,       
lat double,
long double,
in_service int,      
status_key int
)
CLUSTERED BY (dock_id) INTO 64 BUCKETS
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '\t'
STORED AS ORC 
TBLPROPERTIES ("transactional"="true", "compactor.mapreduce.map.memory.mb"="2048", "compactorthreshold.hive.compactor.delta.num.threshold"="4","compactorthreshold.hive.compactor.delta.pct.threshold"="0.5", "skip.header.line.count"="1")
;
