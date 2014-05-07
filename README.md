Dockerfiles
===========

Build a Docker container
------------------------

### Build an API manager docker image

Get a git clone of the build repository.

    git clone https://github.com/thilinapiy/dockerfiles
        
Download [Oracle JDK 7](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html) tar.gz (not JDK 8) and place it in '/dockerfiles/base/dist/'

    mv <download path>/jdk-7u55-linux-x64.tar.gz /dockerfiles/base/dist/
        
Download [WSO2 API manager](http://wso2.com/products/api-manager) and place that in '/dockerfiles/base/dist/'

    mv <download path>/wso2am-1.6.0.zip /dockerfiles/base/dist/
        
Change directory to '/dockerfiles/base/'.

    cd dockerfiles/base/
        
Run docker command to build image.

    docker build -t apim_image .


Start a Docker container
------------------------

### Start API manager from the build image

Start in interactive mode

    docker run -i -t --name apim_test apim_image /bin/bash
        
Start in daemon mode

    docker run -d    --name apim_test apim_image /bin/bash

