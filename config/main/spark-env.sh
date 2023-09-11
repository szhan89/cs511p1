#!/bin/bash

# Set Spark-related environment variables
export HADOOP_HOME="/opt/hadoop"
export SPARK_HOME="/opt/spark"
export SPARK_CONF_DIR="${SPARK_HOME}/conf"
export HADOOP_CONF_DIR="${HADOOP_HOME}/etc/hadoop"
export SPARK_DIST_CLASSPATH=$(${HADOOP_HOME}/bin/hadoop classpath)
export SPARK_MASTER_HOST="main"  # Bind to all interfaces. Adjust if needed.
export SPARK_MASTER_PORT=7077  # Default Spark master port
export SPARK_MASTER_WEBUI_PORT=8080  # Default Spark master Web UI port
export SPARK_LOG_DIR=/var/log/spark  # Directory where Spark should store its logs.

# Optionally, for better logging
export SPARK_MASTER_OPTS="-Dspark.eventLog.enabled=true -Dspark.eventLog.dir=${SPARK_LOG_DIR}/events"
