--Output/Input Station Ranking in a Year

set hive.exec.reducers.max=1;

--Output Rank 
CREATE table year_output_rank
AS select startstationid, count(*) as outflow FROM trip1015_0916 GROUP BY startstationid ORDER by outflow DESC;
--See the top 50 output ranking station
select * from year_output_rank limit 50; 
--See the output number curve
select outflow from year_output_rank; 

--Input Rank
CREATE table year_input_rank
AS select endstationid, count(*) as inflow FROM trip1015_0916 GROUP BY endstationid ORDER by inflow DESC;
--See the top 50 input ranking station
select * from year_input_rank limit 50; 
--See the input number curve
select inflow from year_input_rank; 


--Find the overlap of station if in the top 50 output/input
select year_output_rank.startstationid, year_output_rank.outflow, year_input_rank.endstationid, year_input_rank.inflow
from year_output_rank 
join year_input_rank
where outflow >= 54401 AND inflow >= 53365 AND startstationid == endstationid;

--Station Year Input-Output Rank  
CREATE table year_delta_rank
AS select year_output_rank.startstationid, (year_input_rank.inflow - year_output_rank.outflow) as year_delta, year_input_rank.endstationid  
FROM year_output_rank 
JOIN year_input_rank
WHERE startstationid == endstationid
ORDER BY year_delta 

-- See the Input oriented stations (top 30)
select * from year_delta_rank
ORDER BY year_delta DESC limit 30;

-- See the Output oriented stations (top 30)
select * from year_delta_rank
ORDER BY year_delta ASC limit 30;

-- See the neutral stations (|input - output| < 500)
select count(*) from year_delta_rank
WHERE year_delta BETWEEN -500 AND 500;

-- See the neutral stations (|input - output| < 1000)
select count(*) from year_delta_rank
WHERE year_delta BETWEEN -1000 AND 1000;

-- See the neutral stations (|input - output| < 2000)
select count(*) from year_delta_rank
WHERE year_delta BETWEEN -2000 AND 2000;

-- See the neutral stations (|input - output| < 4000)
select count(*) from year_delta_rank
WHERE year_delta BETWEEN -4000 AND 4000;

-- SEE some neutral station instances  
select * from year_delta_rank
WHERE year_delta BETWEEN -500 AND 500;



