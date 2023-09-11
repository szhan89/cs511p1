####################################################################################
# DO NOT MODIFY THE BELOW ##########################################################

FROM cs511p1-common

# DO NOT MODIFY THE ABOVE ##########################################################
####################################################################################

COPY ./setup-worker.sh ./setup-worker.sh
RUN /bin/bash setup-worker.sh

COPY ./start-worker.sh ./start-worker.sh
CMD ["/bin/bash", "start-worker.sh"]

COPY ./resources/hadoop-terasort-3.3.6.jar ./hadoop-terasort-3.3.6.jar
RUN mkdir -m a=rwx hadoop-terasort
RUN unzip hadoop-terasort-3.3.6.jar -d ./hadoop-terasort

RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.6/hadoop-3.3.6.tar.gz
RUN tar -xzf hadoop-3.3.6.tar.gz
RUN mv hadoop-3.3.6 hadoop

COPY ./core-site.xml ./hadoop/etc/hadoop/core-site.xml
COPY ./hdfs-site-worker.xml ./hadoop/etc/hadoop/hdfs-site.xml

RUN echo "export JAVA_HOME=/usr/local/openjdk-8" >> ./hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export HDFS_NAMENODE_USER="root"" >> ./hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export HDFS_DATANODE_USER="root"" >> ./hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export HDFS_SECONDARYNAMENODE_USER="root"" >> ./hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export YARN_RESOURCEMANAGER_USER="root"" >> ./hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export YARN_NODEMANAGER_USER="root"" >> ./hadoop/etc/hadoop/hadoop-env.sh