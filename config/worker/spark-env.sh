#!/bin/bash

# Define the Java and Scala home directories if necessary
# JAVA_HOME is already set in your Dockerfile's base image, so we can skip it here
# export JAVA_HOME="/path/to/java"
# export SCALA_HOME="/path/to/scala"

# Set Spark-related environment variables
export SPARK_WORKER_MEMORY="1g"  # Amount of memory to use per worker node. Adjust this based on your Docker container's settings.
export SPARK_WORKER_CORES=1  # Number of cores to use on the worker. Adjust based on your container's settings.
export SPARK_LOG_DIR="/var/log/spark"  # Directory where Spark should store its logs.
export SPARK_WORKER_DIR="/var/data/spark"  # Directory to run apps in, which will include both logs and scratch space (local directories).
export SPARK_LOCAL_DIRS="/var/data/spark"  # Directory to use for "scratch" space in Spark, including map output files and RDDs that get stored on disk.

# If you have a lot of RAM, you might increase this value
# This helps to control the amount of off-heap memory Spark uses.
# export SPARK_DAEMON_MEMORY="2g"

# Optionally, for better logging
export SPARK_WORKER_OPTS="-Dspark.eventLog.enabled=true -Dspark.eventLog.dir=/var/log/spark/events"
