create external table 201510_wea_v1 (data1 string, date string, time string, data4 string, data5 string,
       data6 string, data7 string, data8 string, wtype string, data10 string, temp int,
       data11 string, data13 string, data14 string, data15 string,
       data16 string, data17 string, data18 string, data19 string, data20 string,
       data21 string, data22 string, data23 string, data24 string, data25 string,
       data26 string, data27 string, data28 string, data29 string, data30 string,
       data31 string, data32 string, data33 string, data34 string, data35 string,
       data36 string, data37 string, data38 string, data39 string, data40 string,
       data41 string, data42 string, data43 string, data44 string
     ) row format delimited fields terminated by ',' location '/user/iwl210/201510';

CREATE TABLE 201510_wea_v2 AS SELECT date, time, wtype, temp FROM 201510_wea_v1;
CREATE TABLE 201510_wea_v4 AS SELECT from_unixtime(unix_timestamp(CONCAT(CONCAT(date,time),"00"),'yyyyMMddHHmmss'))
as newtime, wtype, temp FROM 201510_wea_v2;


CREATE TABLE triptable10_v1 AS SELECT *
FROM  trip1015_0916_v2
WHERE startt  >= unix_timestamp('2015-10-01 00:00:00') AND  startt <= unix_timestamp('2015-11-01 00:00:00');

CREATE TABLE triptable10_v2 AS SELECT ROW_NUMBER() OVER() as row_num, *
FROM triptable10_v1;

CREATE TABLE tripwea10_v1 AS SELECT a.row_num, a.tripd, a.startt, a.stopt,
         b.newtime, b.wtype, b.temp
            FROM  triptable10_v2 a
            JOIN 201510_wea_v4 b
            WHERE b.newtime  >= a.startt
             AND  b.newtime  <= a.stopt;

CREATE TABLE tripwea10_v2 AS SELECT * FROM tripwea10_v1 where array_contains(split(wtype,' '),'-RA');

CREATE TABLE tripwea10_v3 AS SELECT row_num, tripd, COUNT(distinct newtime) AS counter
FROM tripwea10_v2
GROUP BY row_num,tripd;

CREATE TABLE tripwea10_v4 AS SELECT * FROM tripwea10_v1 where array_contains(split(wtype,' '),'+RA');

CREATE TABLE tripwea10_v5 AS SELECT row_num, tripd, COUNT(distinct newtime) AS counter
FROM tripwea10_v4
GROUP BY row_num,tripd;



CREATE TABLE tripwea10_v6 AS SELECT * FROM tripwea10_v1 where array_contains(split(wtype,' '),'-SN');

CREATE TABLE tripwea10_v7 AS SELECT row_num, tripd, COUNT(distinct newtime) AS counter
FROM tripwea10_v6
GROUP BY row_num,tripd;


CREATE TABLE tripwea10_v8 AS SELECT * FROM tripwea10_v1 where array_contains(split(wtype,' '),'+SN');

CREATE TABLE tripwea10_v9 AS SELECT row_num, tripd, COUNT(distinct newtime) AS counter
FROM tripwea10_v8
GROUP BY row_num,tripd;

SELECT AVG(tripd) FROM tripwea10_v3 WHERE tripd < 4500;
SELECT count(*) FROM tripwea10_v3 WHERE tripd < 4500;

SELECT AVG(tripd) FROM tripwea10_v5 WHERE tripd < 4500;
SELECT count(*) FROM tripwea10_v5 WHERE tripd < 4500;

SELECT AVG(tripd) FROM tripwea10_v7 WHERE tripd < 4500;
SELECT count(*) FROM tripwea10_v7 WHERE tripd < 4500;

SELECT AVG(tripd) FROM tripwea10_v9 WHERE tripd < 4500;
SELECT count(*) FROM tripwea10_v9 WHERE tripd < 4500;
