CREATE TABLE station_rawdata3 (
dock_id int, 
dock_name string,
date string,
our int,   
minute int, 
pm int,      
avail_bikes int,    
avail_docks int,     
tot_docks int,       
lat double,
long double,
in_service int,      
status_key int
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
tblproperties("skip.header.line.count"="1");

-- QQT string,QQU string,QQV string,QQW string,QQX string,QQY string,QQZ string,QRA string,QRB string,QRC string,QRD string,QRE string,QRF string,QRG string,QRH string,QRI string,QRJ string,QRK string,QRL string,QRM string,QRN string,QRO string,QRP string,QRQ string,QRR string,QRS string,QRT string,QRU string,QRV string,QRW string,QRX string,QRY string,QRZ string,QSA string,QSB string,QSC string,dock_name6 string
-- PARTITIONED BY (dock_id int) 
-- ROW FORMAT DELIMITED 
-- FIELDS TERMINATED BY  '\t' ESCAPED BY '"' LINES TERMINATED BY '\n';

-- call load_databus_table.sh to load data into table
CREATE TABLE station_rawdata AS select dock_id,dock_name,avail_bikes,avail_docks,tot_docks,lat,long,in_service,status_key, from_unixtime(unix_timestamp(CONCAT(regexp_replace(date,'"', ''),our,':',minute,IF(pm=0,'AM','PM')), 'yy-MM-ddHH:mmaa')) as created_at from station_rawdata3;
