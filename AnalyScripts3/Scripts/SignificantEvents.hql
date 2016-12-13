-- This creates a table with the normalized bike count difference to 10 mins, the average time gap between two data  
create table station_diff2_201510_201609_killnull_yesservice_nor as select *, bike_delta/((unix_timestamp(end_time) - unix_timestamp(start_time))/600) AS nor_del from station_diff2_201510_201609_killnull_yesservice_nodup;

-- This creates a table that selects what we define as a signigicant event
create table station_diff2_201510_201609_killnull_yesservice_nor_2 as select * from station_diff2_201510_201609_killnull_yesservice_nor where abs(bike_delta)>10 and abs(nor_del)> tot_docks;

-- The Following two table group the event count by significance
create table station_nor_range_201510_201609_temp2 as select (CEIL(nor_del)), (CEIL(nor_del)+5), count(*) from station_diff2_201510_201609_killnull_yesservice_nor_2 group by CEIL(nor_del), (CEIL(nor_del)+5);
create table station_nor_range_201510_201609 as select `_c0` AS lower, `_c1` AS upper, `_c2` As count from station_nor_range_201510_201609_temp order by lower;
