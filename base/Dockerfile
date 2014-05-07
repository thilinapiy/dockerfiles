# Dockerfile to build WSO2 container
#
# Copyright 2014 H. Thilina C. Piyasundara
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
# http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Usage :- 
# Build the container
# 	cd <path>/dockerfiles/base
# 	sudo docker build -t WSO2container .
# 
# Run a container using the buled image
# 	sudo docker run -d -i -t --name WSO2Container1 WSO2container /bin/bash
#
# Login to the running container
# 	sudo docker attach WSO2Container1
#
# Exit from a attached container
# 	^p^q (Ctrl+p and Ctrl+q)
#
	
# Use Ubuntu base image
FROM ubuntu:14.04

# Maintainer
MAINTAINER Thilina Piyasundara <mail@thilina.org>

# Update the container and install relevant packages
RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install unzip puppet

# Create /mnt/packs directory
RUN mkdir -p /mnt/packs
# Copy WSO2 product zip into /mnt/packs
ADD dist/wso2am-1.6.0.zip /mnt/packs/
# eg :-
# ADD dist/<WSO2 product zip> /mnt/packs/

# Unzip WSO2 product
RUN unzip -q /mnt/packs/wso2am-1.6.0.zip -d /mnt/
# eg :-
# RUN unzip -q /mnt/packs/<WSO2 product zip> -d /mnt/

# Copy Oracle JDK into /opt directory
ADD dist/jdk-7u55-linux-x64.tar.gz /opt/
# eg :-
# ADD dist/<Latest Oracle JDK tar> /opt/

# Create symlink to JDK as /opt/java
RUN ln -s /opt/jdk1.7.0_55 /opt/java
# eg :-
# RUN ln -s /opt/<JDK decompressed directory name> /opt/java

# Set environment variables
ENV HOME /root
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/java/bin
ENV JAVA_HOME /opt/java

WORKDIR /root
