FROM tensorflow/serving:2.18.0

# 安装基础依赖（含 Java）
RUN apt-get update && \
    apt-get install -y openjdk-11-jre-headless wget curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# 安装 Hadoop
ENV HADOOP_VERSION=3.3.6
RUN wget https://downloads.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz && \
    tar -xzf hadoop-${HADOOP_VERSION}.tar.gz -C /opt && \
    rm hadoop-${HADOOP_VERSION}.tar.gz

# 设置 Hadoop 环境变量
ENV HADOOP_HOME=/opt/hadoop-${HADOOP_VERSION}
ENV PATH=$HADOOP_HOME/bin:$PATH
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# 拷贝 models.config（可选）
COPY models.config /models/multiModel/models.config
