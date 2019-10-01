#!/bin/bash

# Define working paths

HADOOP_PATH='/usr/local/hadoop'
LOCAL_PATH='/home/hduser/OlympicFiltering'
HDFS_PATH='/sqoop/season_filter'

# Start Hadoop services

$HADOOP_PATH/sbin/start-dfs.sh
$HADOOP_PATH/sbin/start-yarn.sh

#Create folder structure on HDFS and copyinput files from local file system 

#$HADOOP_PATH/bin/hdfs dfs -mkdir $HDFS_PATH
#$HADOOP_PATH/bin/hdfs dfs -mkdir $HDFS_PATH/input
#$HADOOP_PATH/bin/hdfs dfs -put $LOCAL_PATH/input/* $HDFS_PATH/input

#Delete output if exists
#NOTE: If the output folder exists Hadoop stops with error.

$HADOOP_PATH/bin/hdfs dfs -rm $HDFS_PATH/output/*
$HADOOP_PATH/bin/hdfs dfs -rmdir $HDFS_PATH/output

# Run filtering with existing .jar

$HADOOP_PATH/bin/hadoop jar $LOCAL_PATH/Filtering.jar FilteringDriver $HDFS_PATH $HDFS_PATH/output

#Copy output files to local file system 

mkdir $LOCAL_PATH/output
$HADOOP_PATH/bin/hdfs dfs -copyToLocal $HDFS_PATH/output/* $LOCAL_PATH/output
