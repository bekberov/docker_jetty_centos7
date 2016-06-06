 FROM antik486/centos71

 MAINTAINER bekberov <bekberovkerim@gmail.com>

 RUN  \
        yum update -y  && \
        yum install -y java-1.8.0-openjdk wget tar && \
        wget http://mirrors.nic.cz/eclipse/jetty/stable-9/dist/jetty-distribution-9.3.9.v20160517.tar.gz  && \
        tar zxvf jetty-distribution-9.3.9.v20160517.tar.gz -C /opt/ && \
        mv /opt/jetty-distribution-9.3.9.v20160517/ /opt/jetty && \
        yum clean all  && \
        rm -rf /var/tmp/* ;

EXPOSE 8080
