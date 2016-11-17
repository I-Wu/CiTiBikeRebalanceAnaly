create external table trip_table 
(
	tripduration int, 
	starttime string, 
	stoptime string, 
	startStationId int, 
	startStationName string, 
	startStationLa string, 
	startStationLo string, 
	endStationId int, 
	endStationName string, 
	endStationLa string, 
	endStationLo string, 
	bikeId int, 
	usertype string, 
	birthyear string, 
	gender int
)
 row format delimited fields terminated by ',' 
 location '/user/hpl240/test';