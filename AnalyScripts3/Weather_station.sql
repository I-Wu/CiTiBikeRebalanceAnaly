CREATE TABLE tripwea03_v10 AS SELECT a.row_num, a.tripd, a.startt, a.stopt, a. startstationid AS sid, a.endstationid AS eid,
         b.newtime, b.wtype, b.temp
            FROM  triptable03_v2 a
            JOIN  201603_wea_v4 b
            WHERE b.newtime  >= a.startt
            AND  b.newtime  <= a.stopt;

CREATE TABLE tripwea03_v11 AS SELECT * FROM tripwea03_v10 where array_contains(split(wtype,' '),'-RA');

CREATE TABLE tripwea03_v12 AS SELECT row_num, tripd, sid, eid, COUNT(distinct newtime) AS counter
FROM tripwea03_v11
GROUP BY row_num,tripd, sid, eid;

CREATE TABLE tripweaRank03_v1 AS SELECT
sid, count(*) as outflow FROM tripwea03_v12 GROUP BY sid ORDER by outflow DESC;

CREATE TABLE tripweaRank03_v2 AS SELECT
eid, count(*) as inflow FROM tripwea03_v12 GROUP BY eid ORDER by inflow DESC;

CREATE TABLE tripwea03_v13 AS SELECT * FROM tripwea03_v10 where array_contains(split(wtype,' '),'+RA');

CREATE TABLE tripwea03_v14 AS SELECT row_num, tripd, sid, eid, COUNT(distinct newtime) AS counter
FROM tripwea03_v13
GROUP BY row_num,tripd, sid, eid;

CREATE TABLE tripweaRank03_v3 AS SELECT
sid, count(*) as outflow FROM tripwea03_v14 GROUP BY sid ORDER by outflow DESC;

CREATE TABLE tripweaRank03_v4 AS SELECT
eid, count(*) as inflow FROM tripwea03_v14 GROUP BY eid ORDER by inflow DESC;
