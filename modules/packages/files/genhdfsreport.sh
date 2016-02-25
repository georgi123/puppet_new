MODE=$1
su hdfs -c "hdfs dfsadmin -report $MODE"
