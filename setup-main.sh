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

# Define Spark version
SPARK_VERSION=3.1.2
SPARK_HOME=/opt/spark

# Download and install Spark
curl -O https://downloads.apache.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop3.2.tgz
tar -xzf spark-${SPARK_VERSION}-bin-hadoop3.2.tgz -C /opt/
mv /opt/spark-${SPARK_VERSION}-bin-hadoop3.2 ${SPARK_HOME}
rm spark-${SPARK_VERSION}-bin-hadoop3.2.tgz

# Set SPARK_HOME environment variable and add it to PATH
echo "export SPARK_HOME=${SPARK_HOME}" >> ~/.bashrc
echo "export PATH=$PATH:${SPARK_HOME}/bin:${SPARK_HOME}/sbin" >> ~/.bashrc
source ~/.bashrc
