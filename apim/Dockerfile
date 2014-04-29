#
# cd <path>/dockerfiles/
# docker build -t thilina/apim apim
# docker run -d -i -t --name apim_test thilina/apim /bin/bash
#
# Base image
FROM ubuntu:14.04

RUN mkdir -p /mnt/packs
RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install unzip puppet vim 

ADD dist/wso2am-1.6.0.zip /mnt/packs/
##ADD dist/environment /etc/environment
ADD dist/jdk-7u55-linux-x64.tar.gz /opt/

RUN ln -s /opt/jdk1.7.0_55 /opt/java
RUN unzip -q /mnt/packs/wso2am-1.6.0.zip -d /mnt/

ENV HOME /root
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/java/bin
ENV JAVA_HOME /opt/java

WORKDIR /root
