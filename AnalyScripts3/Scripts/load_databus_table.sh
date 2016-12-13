USERNAME=chc631

for year in 2015 2016; do 
  for month in $(seq -w 1 12); do
    beeline -u jdbc:hive2://babar.es.its.nyu.edu:10000/CitiBike_Station2 -n $USERNAME -e "LOAD DATA LOCAL INPATH '/home/chc631/CiTiBikeRebalanceAnaly/datasets/localBusRaw/$year-$month/bikeshare_nyc_raw.csv' INTO TABLE  station_rawdata3;"
  done
done
