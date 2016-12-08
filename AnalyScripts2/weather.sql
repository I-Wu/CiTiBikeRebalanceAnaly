from_unixtime(unix_timestamp(substr('20130502081559999',1,14), 'yyyyMMddHHmmss'))

SELECT a.action_date, b.*
   FROM  b
   JOIN  a ON action_date>= activation_date
           AND (action_date<=deletion_date OR deletion_date='1970-01-01')


create table 201609_merge_v1 AS SELECT 201609_wea_v3.newtime, 201609_wea_v3.wtype, station_20160901_07_new.start_time, station_20160901_07_new.end_time, station_20160901_07_new.delta
   FROM  station_20160901_07_new
   JOIN  201609_wea_v3 WHERE newtime<= end_time
           AND newtime>= start_time;


CREATE TABLE 201609_wea_full_v1 AS SELECT from_unixtime(unix_timestamp(CONCAT(CONCAT(date,time),"00"),'yyyyMMddHHmmss')) as newtime, wtype, temp FROM 201609_wea;

create table 201609_merge_v3 AS SELECT 201609_wea_full_v1.newtime, 201609_wea_full_v1.wtype, station_20160901_full.start_time, station_20160901_full.end_time, station_20160901_full.delta
FROM  station_20160901_07_new
   JOIN  201609_wea WHERE newtime<= end_time
           AND newtime>= start_time;

create table 201609_merge_v4 AS SELECT * from 201609_merge_v3 where length(wtype)>=2;

select * from 201609_merge_v4 where array_contains(split(wtype,' '),'+RA');
