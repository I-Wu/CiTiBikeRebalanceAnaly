TABLENAME=station_geoloc_acid
DOCK_ID=$1
DOCK_NAME="$2"
LAT=$3
LONG=$4
beeline -u jdbc:hive2://babar.es.its.nyu.edu:10000/CitiBike_Station2 -n chc631 -e "set hive.auto.convert.join.noconditionaltask.size = 10000000; set hive.support.concurrency = true; set hive.enforce.bucketing = true; set hive.exec.dynamic.partition.mode = nonstrict; set hive.txn.manager = org.apache.hadoop.hive.ql.lockmgr.DbTxnManager; set hive.compactor.initiator.on = true; set hive.compactor.worker.threads = 1 ; DELETE from $TABLENAME WHERE dock_id=$DOCK_ID and dock_name rlike \"$DOCK_NAME\" and lat=$LAT and long=$LONG"

beeline -u jdbc:hive2://babar.es.its.nyu.edu:10000/CitiBike_Station2 -n chc631 -e "set hive.auto.convert.join.noconditionaltask.size = 10000000; set hive.support.concurrency = true; set hive.enforce.bucketing = true; set hive.exec.dynamic.partition.mode = nonstrict; set hive.txn.manager = org.apache.hadoop.hive.ql.lockmgr.DbTxnManager; set hive.compactor.initiator.on = true; set hive.compactor.worker.threads = 1 ; DELETE from station_201510_201609_acid WHERE dock_name rlike 'Coming soon: ' and name rlike rlike 'Coming soon:' and name rlike rlike 'Coming soon';"

