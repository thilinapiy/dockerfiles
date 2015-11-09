Dockerfiles/APIM-Distributed [Experimental]
===========================================

Build a distributer API Manager docker container cluster
------------------------

### Build an API manager docker image

Get a git clone of the build repository.

    git clone https://github.com/thilinapiy/dockerfiles(https://github.com/thilinapiy/dockerfiles)
        
Download [Oracle JDK 7](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html) tar.gz (not JDK 8) and place it in 'dockerfiles/apim-distributed/dist/'

    mv <download path>/jdk-7u71-linux-x64.tar.gz dockerfiles/apim-distributed/dist/
        
Download [WSO2 API manager](http://wso2.com/products/api-manager) and place that in 'dockerfiles/apim-distributed/dist/'

    mv <download path>/wso2am-1.9.1.zip dockerfiles/apim-distributed/dist/

Download [SVN Kit] () and place it in 'wso2base' puppet module

    svnkit-bundle-1.0.0.jar   dockerfiles/apim-distributed/dist/puppet/modules/wso2base/files/configs/repository/components/dropins/


Download [MySQL driver] (http://dev.mysql.com/downloads/connector/j/) unzip/untar and copy the jar to 'wso2base' puppet module

    mysql-connector-java-5.1.33-bin.jar   apim-distributed/dist/puppet/modules/wso2base/files/configs/repository/components/lib/


Builed the APIM docker image
----------------------------

Change directory to 'dockerfiles/apim-distributed/'.

    cd dockerfiles/apim-distributed/
        
Run docker command to build image.

    docker build -t apim .


Install docker compose
----------------------

    sudo curl -L https://github.com/docker/compose/releases/download/1.5.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

    sudo chmod +x /usr/local/bin/docker-compose


Start a Docker containers using docker compose 
----------------------------------------------

Note: Do *not* start all containes at once because it takes sometime to start the mysql server and populate the databases.

Remove unused docker instances with same name

    docker-compose rm 
 
Start MySQL server 

    docker-compose up -d mysql
        
Start MySQL client

    docker-compose up -d mysql-client

Note: MySQL client will get killed it self after populating initial databases and tables

Start APIM

    docker-compose up -d apim-node1


Login to any docker instance
-----------------------------

Use 'exec' command to login to docker instances

    docker exec -i -t <instance-id/name> bash


