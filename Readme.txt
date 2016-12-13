—————————————————-———
*        New York Citi Bike data analytics        *
—————————————————-———
***Data Profiling
-Weather Data
File: Profile.jar      
Description: Determine column length of weather files (yyyymm.csv)


-Citi Bike Trip Data
Files: tripProfile.java   tripProfileMapper.java  tripProfileReducer.java
Description: Clear out the columns to be used and count largest the length of the values.


***Date Prepocessing
File name: Organizing_Bike_Trip_Data.sql 
Description: 
1. Create table “trip1015_0916” reading 12 csv files of bike trip data from 2015/10/01 - 2016/09/30 
2. Check the row number of a whole year of bike trip data (total: 13266308 rows)


Station Data Preprocessing
Raw data http://www.theopenbus.com/raw-data.html
1.Scripts/create_databus_table.hql
This script creates the table schema to import rawdata
2. Scripts/load_databus_table.sh
This script loads the CSV rawdata in HDFS into Hive
3.Scripts/create_databus_acid.hql
This script creates ACID tables for row deletions
4.acid_table_deletor.sh
This script cleans unwanted rows from ACID tables
5. Scripts/kill_null.sh
1. Removes rows where stations are not in service.
2. Calculate bike_count to tot_station - avail_station where bike_count is Null
6. Scripts/delete_dup.sh
Delete rows with the same timestamp




***Analytics


Our analytics can be separated into several parts. 


————————————————————————————————————————
Topic: Analysis of the trip duration distribution by month 


File name: Output_Input_Rank.sql


Description: We collect the number of trip count by each month and divide them by 4 ranges of trip duration (<15 minutes, 15 - 30 minutes, 30 - 45 minutes, 45 minutes). By having these number distribution, we can see the trend of the trip sum in each month and also see for example, how many trips in January with the duration under 15 minutes. 


In the lines of codes, we select the data from table of “trip1015_0916” which has the whole year(from 2015/10 to 2016/09) of detailed trip data. And we screen out the data information by setting up “date and time range” and  “trip duration time (in seconds)”.


————————————————————————————————————————
Topic: Analysis of the bike inflow and outflow amount 


- Phase 1 
File name: Output_Input_Rank.sql
Description:  Firstly, by grouping the station id in the table of “trip1015_0916” , we create two tables for ranking the bike stations in terms of yearly trip outflow and inflow. Note that each row in the table of “trip1015_0916” is a single bike trip inforamtion which includes start time, start station id, stop time, end station id. So when reading each row, we count 1 output at the start station id in table “year_output_rank”, and count 1 input at the end station id in table “year_input_rank”. 


After making the two ranking tables, the rest of the codes do:
1. See the station id paired with the top 50 outflow/inflow number.
2. See the outflow/inflow number in descending order to make us draw the outflow/inflow curve.


Secondly, we create the table “year_delta_rank” which has a delta value standing for (inflow - outflow) at each station id. By using this table, we can use the rest of codes to see if the station is an input or output oriented station and can also see they in ranking order. And by selecting the station with the condition where the absolute value of delta is less than xxx, we can see the distribution by characterizing the station as an input oriented, output oriented, or neutral station. 




- Phase 2
File name: Weather_station.sql
Description:  In this phase, we characterize the property of each station, just as phase one, but now it varies dymamically based on the weather type and the month. For each month, we come up with 4 ranking tables.
1. inflow ranking under the condition of light rain    (tablexx_v11)
2. outflow ranking under the condition of light rain  (tablexx_v12)
3. inflow ranking under the condition of heavy rain (tablexx_v13)
4. outflow ranking under the condition of light rain  (tablexx_v14)
Note that: xx ranges from 01 to 12 




————————————————————————————————————————
Topic: Weather type analysis on user behaviors 
File name: Weather_demand.sql
Description: In general, users’ behaviors depend on the weather type. For every trip, we assign none or some weather types for this trip based on the start time and the end time of this trip. For any given month, the trip data is stored in table “triptablexx_v2” (xx ranges from 01 to 12) and weather type observed is stored in “xxxxxx_wea_v4” (xxxxxx is yyyy/MM ranges from 2015/10 to 2016/09).


This file generates a series of table named as “tripweaxx_vi” (version i) which are merged trip wea table for different use. The following table shows the information of several main tables.




**************************************************************************
version         Descriptions
**************************************************************************
1                  The table for the entire month    
3, 5, 7, 9      The table of trips under weather conditions of 4 different weather types
-RA(light rain), +RA(heavy rain), -SN(light snow), +SN(heavy snow)
* row_num: the trip id   (data type: string)
* tripd: the trip duration (data type: int, unit: sec)
* counter: how many observation points of the certain weather type that the trip duration covers 


Input data file:
* trip1015_0916 : table mentioned before
* yyyymm.csv : the weather date of the given month 


The remaining select statements from line #58 to #68 are used to sreeen out unreasonable trip time (>4500sec). 


————————————————————————————————————————


Topic: Examine the current bike rebalancing events


File name: seperator_easy.py, seperator.py, merge_tables.sh, Examine_Rebalancing_Event.sql


Description:
-Phase 1 
Calculate available bike difference of each station to analyze rebalancing events by comparing with trip data 
1. seperator_easy.py
Iterative 800 hive jobs, and calculate bike differential between two consecutive timestamps
2.seperator.py
Split about 800 stations into 10 hive jobs, and calculate bike differencesl between two consecutive timestamps
3. merge_tables.sh
Combine table splits from 2. to generate “station_diff_201510_201609_killnull_yesservice_nodup”




-Phase 2
The table of “station_diff_201510_201609_killnull_yesservice_nodup” contains the delta value of (inflow - outflow) gathered at station with a consecutive time period(roughly with an interval of 10 minutes) though out 201510 to 201609. 


1.Join the table table of “trip1015_0916” and the table of “station_diff_201510_201609_killnull_yesservice_nodup” and create two seperate tables “station_outtrip_timeperiod” and “station_intrip_timeperiod”. In table “station_outtrip_timeperiod”, we match each output trip information with the time interval given from “station_diff_201510_201609_killnull_yesservice_nodup”. 
On the other hand, we also join the two tables and match each input trip information with the time interval given from “station_diff_201510_201609_killnull_yesservice_nodup” for the table “station_intrip_timeperiod”.


We also create the table for the station and trip data only in September for quicker understanding. We use the data from table “trip_09” and table “station_09” , and create the joined table of “station_intrip09_timeperiod” for input and “station_outtrip09_timeperiod” for output.


2. Table “intrip09_timeperiod_count”, “outtrip09_timeperiod_count”: we group the station id, time interval and count the output trips for each group for September. 


3. Table “intrip09_tripdelta_v2” : we compute a delta value (input - output trips) from trip data for September. 


4. We match the delta value from trip data and the delta value from station data to see if there is a mismatch, we may assume there is a bike rebalancing event. 


————————————————————————————————————————
Topic: Analyzing significant events
File Name: SignificantEvents.hql
This script is used to detect significant change in the level of station availble bikes.
————————————————————————————————————————
Topic: Visualisation with CartoDB
1. Scripts/geo2hive.hql
This script loads geoJSON data to HIVE
2.Scripts/add_header.sh
Add header to exported hive table to CSV format