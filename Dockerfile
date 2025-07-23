FROM tensorflow/serving:2.18.0

# 例如：添加 HDFS 支持（或你自己定制的功能）
# 安装 hadoop client 或其他依赖
RUN apt-get update && \
    apt-get install -y hadoop hdfs-cli libhdfs0 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# 可选：拷贝你的 models.config 或脚本
COPY models.config /models/multiModel/models.config
