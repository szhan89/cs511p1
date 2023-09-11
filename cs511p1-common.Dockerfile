####################################################################################
# DO NOT MODIFY THE BELOW ##########################################################

FROM openjdk:8

RUN apt update && \
    apt upgrade --yes && \
    apt install ssh openssh-server --yes

# Setup common SSH key.
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/shared_rsa -C common && \
    cat ~/.ssh/shared_rsa.pub >> ~/.ssh/authorized_keys && \
    chmod 0600 ~/.ssh/authorized_keys

# DO NOT MODIFY THE ABOVE ##########################################################
####################################################################################

# Setup HDFS/Spark resources here

# Set Hadoop version and home directory
ENV HADOOP_VERSION 3.3.6
ENV HADOOP_HOME /opt/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin

# Install necessary utilities and download Hadoop using curl
RUN apt-get update && apt-get install -y curl tar && \
    curl -O https://downloads.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz && \
    tar -xvf hadoop-${HADOOP_VERSION}.tar.gz -C /opt && \
    mv /opt/hadoop-${HADOOP_VERSION} ${HADOOP_HOME} && \
    rm hadoop-${HADOOP_VERSION}.tar.gz

# Set JAVA_HOME for Hadoop
RUN echo "export JAVA_HOME=/usr/local/openjdk-8" >> ${HADOOP_HOME}/etc/hadoop/hadoop-env.sh

# Set core config here since it is common for both 
COPY ./core-site.xml ${HADOOP_HOME}/etc/hadoop/core-site.xml

# Set Spark version, download, and extract it
ENV SPARK_VERSION=3.4.1
ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:${SPARK_HOME}/bin

RUN curl -O https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop3.tgz && \
    tar -xvf spark-${SPARK_VERSION}-bin-hadoop3.tgz -C /opt && \
    mv /opt/spark-${SPARK_VERSION}-bin-hadoop3 ${SPARK_HOME} && \
    rm spark-${SPARK_VERSION}-bin-hadoop3.tgz && \
    mkdir -p /var/log/spark/events

# Set PATH for Spark
ENV PATH=$PATH:${SPARK_HOME}/bin

# If you plan on using PySpark, set up the PYTHONPATH as well
ENV PYTHONPATH=${SPARK_HOME}/python:${SPARK_HOME}/python/lib/py4j-0.10.9-src.zip:$PYTHONPATH
