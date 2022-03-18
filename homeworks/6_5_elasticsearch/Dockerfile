FROM centos:7

RUN yum -y update && yum -y install wget perl-Digest-SHA && \
    wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.1.0-linux-x86_64.tar.gz && \
    wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.1.0-linux-x86_64.tar.gz.sha512 && \
    shasum -a 512 -c elasticsearch-8.1.0-linux-x86_64.tar.gz.sha512  && \
    tar -xzf elasticsearch-8.1.0-linux-x86_64.tar.gz && \
    rm elasticsearch-8.1.0-linux-x86_64.tar.gz

RUN adduser elasticsearch && chown -R elasticsearch /elasticsearch-8.1.0 && chown -R elasticsearch /var/lib

CMD ["./bin/elasticsearch"]

USER elasticsearch
WORKDIR elasticsearch-8.1.0
COPY elasticsearch.yml ./config/
EXPOSE 9200


