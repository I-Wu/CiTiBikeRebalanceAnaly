TABLENAME=station_201510_201609_acid_killnull
FIELD=avail_bikes
beeline -u jdbc:hive2://babar.es.its.nyu.edu:10000/CitiBike_Station2 -n chc631 -e "set hive.auto.convert.join.noconditionaltask.size = 10000000; set hive.support.concurrency = true; set hive.enforce.bucketing = true; set hive.exec.dynamic.partition.mode = nonstrict; set hive.txn.manager = org.apache.hadoop.hive.ql.lockmgr.DbTxnManager; set hive.compactor.initiator.on = true; set hive.compactor.worker.threads = 1 ; 
UPDATE $TABLENAME 
SET
    $FIELD = IF ($FIELD IS NULL AND in_service==1, tot_docks-avail_docks, $FIELD);"
 
# WHERE dock_id = 72 and unix_timestamp(created_at)=unix_timestamp('2015-10-01 02:32:00.0');"



TABLENAME=station_201510_201609_acid_killnull_yesservice
beeline -u jdbc:hive2://babar.es.its.nyu.edu:10000/CitiBike_Station2 -n chc631 -e "set hive.auto.convert.join.noconditionaltask.size = 10000000; set hive.support.concurrency = true; set hive.enforce.bucketing = true; set hive.exec.dynamic.partition.mode = nonstrict; set hive.txn.manager = org.apache.hadoop.hive.ql.lockmgr.DbTxnManager; set hive.compactor.initiator.on = true; set hive.compactor.worker.threads = 1 ; 
DELETE from $TABLENAME WHERE in_service=0;"
