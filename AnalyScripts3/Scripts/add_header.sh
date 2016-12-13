-- insert overwrite directory '/user/chc631/public/station_diff_201609_yesservice_csv' row format delimited fields terminated by ',' select * from station_diff_201609_yesservice;
DIRECTORY=$1
HEADER=$2
# for filename in $DIRECTORY/*; do echo $HEADER $filename; done;
for filename in $DIRECTORY/*; do sed -i "1s/^/$HEADER\n/" $filename; done;
