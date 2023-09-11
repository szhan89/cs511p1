####################################################################################
# DO NOT MODIFY THE BELOW ##########################################################

FROM cs511p1-common

# DO NOT MODIFY THE ABOVE ##########################################################
####################################################################################

# Copy HDFS configurations
COPY ./config/worker/hdfs-site.xml ${HADOOP_HOME}/etc/hadoop/hdfs-site.xml
# Copy Spark configurations 
COPY ./config/worker/spark-env.sh ${SPARK_HOME}/conf/

# Setup the worker node
COPY ./setup-worker.sh ./setup-worker.sh
RUN /bin/bash setup-worker.sh

# Start services on the worker node
COPY ./start-worker.sh ./start-worker.sh
CMD ["/bin/bash", "start-worker.sh"]
