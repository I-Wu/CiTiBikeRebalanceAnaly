-- insert into station_201510_201609_acid select * from station_201510_201609;
CREATE TABLE IF NOT EXISTS station_201510_201609_acid (
dock_id int, 
dock_name string,
avail_bikes int,    
avail_docks int,     
tot_docks int,       
lat double,
long double,
in_service int,      
status_key int,
created_at timestamp
)
CLUSTERED BY (dock_id) INTO 64 BUCKETS
STORED AS ORC 
TBLPROPERTIES ("transactional"="true", "compactor.mapreduce.map.memory.mb"="2048", "compactorthreshold.hive.compactor.delta.num.threshold"="4","compactorthreshold.hive.compactor.delta.pct.threshold"="0.5")
;

-- Create ACID table for Station Geo metadata lookup
CREATE TABLE IF NOT EXISTS station_geoloc_acid (
dock_id int, 
dock_name string,
lat double,
long double
)
CLUSTERED BY (dock_id) INTO 64 BUCKETS
STORED AS ORC 
TBLPROPERTIES ("transactional"="true", "compactor.mapreduce.map.memory.mb"="2048", "compactorthreshold.hive.compactor.delta.num.threshold"="4","compactorthreshold.hive.compactor.delta.pct.threshold"="0.5")
;

-- insert into station_201510_201609_acid_killnull select * from station_201510_201609_acid;
CREATE TABLE IF NOT EXISTS station_201510_201609_acid_killnull (
dock_id int, 
dock_name string,
avail_bikes int,    
avail_docks int,     
tot_docks int,       
lat double,
long double,
in_service int,      
status_key int,
created_at timestamp
)
CLUSTERED BY (dock_id) INTO 64 BUCKETS
STORED AS ORC 
TBLPROPERTIES ("transactional"="true", "compactor.mapreduce.map.memory.mb"="2048", "compactorthreshold.hive.compactor.delta.num.threshold"="4","compactorthreshold.hive.compactor.delta.pct.threshold"="0.5")
;

-- insert into station_201510_201609_acid_killnull_yesservice select * from station_201510_201609_acid_killnull;
CREATE TABLE IF NOT EXISTS station_201510_201609_acid_killnull_yesservice (
dock_id int, 
dock_name string,
avail_bikes int,    
avail_docks int,     
tot_docks int,       
lat double,
long double,
in_service int,      
status_key int,
created_at timestamp
)
CLUSTERED BY (dock_id) INTO 64 BUCKETS
STORED AS ORC 
TBLPROPERTIES ("transactional"="true", "compactor.mapreduce.map.memory.mb"="2048", "compactorthreshold.hive.compactor.delta.num.threshold"="4","compactorthreshold.hive.compactor.delta.pct.threshold"="0.5")
;

-- insert into station_201510_201609_acid_yesservice select * from station_201510_201609_acid;
CREATE TABLE IF NOT EXISTS station_201510_201609_acid_yesservice (
dock_id int, 
dock_name string,
avail_bikes int,    
avail_docks int,     
tot_docks int,       
lat double,
long double,
in_service int,      
status_key int,
created_at timestamp
)
CLUSTERED BY (dock_id) INTO 64 BUCKETS
STORED AS ORC 
TBLPROPERTIES ("transactional"="true", "compactor.mapreduce.map.memory.mb"="2048", "compactorthreshold.hive.compactor.delta.num.threshold"="4","compactorthreshold.hive.compactor.delta.pct.threshold"="0.5")
;
