#!/bin/bash
export JAVA_HOME=/usr/local/openjdk-8/jre

####################################################################################
# DO NOT MODIFY THE BELOW ##########################################################

ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

# DO NOT MODIFY THE ABOVE ##########################################################
####################################################################################

# Setup HDFS/Spark main here
#COPY ./core-site.xml ${HADOOP_HOME}/etc/hadoop/core-site.xml
#COPY ./hdfs-site.xml ${HADOOP_HOME}/etc/hadoop/hdfs-site.xml

