hdfs dfs -mkdir cleandata;
hdfs dfs -put Q1.csv cleandata;

$ beeline -u jdbc:hive2://quickstart:10000/default -n cloudera -d org.apache.hive.jdbc.HiveDriver

 create external table q1v4 (data1 string, date string, time string, data4 string, data5 string,
 data6 string, data7 string, data8 string, wtype string, data10 string, temp int,
 data12 string, data13 string, data14 string, data15 string,
 data16 string, data17 string, data18 string, data19 string, data20 string,
 data21 string, data22 string, data23 string, data24 string, data25 string,
 data26 string, data27 string, data28 string, data29 string, data30 string,
 data31 string, data32 string, data33 string, data34 string, data35 string,
 data36 string, data37 string, data38 string, data39 string, data40 string,
 data41 string, data42 string, data43 string, data44 string
 ) row format delimited fields terminated by ',' location '/user/iwl210/cleandata';

CREATE TABLE q1v5 AS SELECT date, time, wtype, temp FROM q1v4;
