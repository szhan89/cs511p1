####################################################################################
# DO NOT MODIFY THE BELOW ##########################################################

FROM cs511p1-common

# DO NOT MODIFY THE ABOVE ##########################################################
####################################################################################

COPY ./config/main/hdfs-site.xml ${HADOOP_HOME}/etc/hadoop/hdfs-site.xml

COPY ./setup-main.sh ./setup-main.sh
RUN /bin/bash setup-main.sh

COPY ./start-main.sh ./start-main.sh
CMD ["/bin/bash", "start-main.sh"]

# Set Spark configurations specific for main node
COPY ./config/main/spark-defaults.conf ${SPARK_HOME}/conf/
COPY ./config/main/spark-env.sh ${SPARK_HOME}/conf/
COPY ./config/main/workers ${SPARK_HOME}/conf/