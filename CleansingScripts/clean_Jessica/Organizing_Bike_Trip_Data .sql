--create table reading 12 csv files of bike trip data from 2015/10/01 - 2016/09/30 

create external table Trip1015_0916 
(tripduration string, starttime string, stoptime string, startStationId string, startStationName string, startStationLa string, startStationLo string, endStationId string, endStationName string, endStationLa string, endStationLo string, bikeId string, usertype string, birthyear string, gender string)
 row format delimited fields terminated by ',' location '/user/hpl240/public/tripData_cleaned';

--check the row number of a whole year of bike trip data
select count(*) from Trip1015_0916;
> 13266308

