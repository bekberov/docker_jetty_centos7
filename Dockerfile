 FROM antik486/centos71

 MAINTAINER bekberov <bekberovkerim@gmail.com>

 ADD ./service/jetty  /etc/default/
 
 RUN  \
        yum update -y  && \
        yum install -y java-1.8.0-openjdk wget tar && \
        wget http://mirrors.nic.cz/eclipse/jetty/stable-9/dist/jetty-distribution-9.3.9.v20160517.tar.gz  && \
        tar zxvf jetty-distribution-9.3.9.v20160517.tar.gz -C /opt/ && \
        mv /opt/jetty-distribution-9.3.9.v20160517/ /opt/jetty && \
        yum clean all  && \
        rm -rf /var/tmp/* ;

 RUN  \
        useradd -m jetty  && \
        chown -R jetty:jetty /opt/jetty/ && \
        ln -s /opt/jetty/bin/jetty.sh /etc/init.d/jetty && \
        chkconfig --add jetty && \
        chkconfig --level 345 jetty on;


 ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.91-0.b14.el7_2.x86_64/jre

 
 EXPOSE 8080
