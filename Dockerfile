FROM rsippl/centos-jdk

MAINTAINER Ralf Sippl <ralf.sippl@gmail.com>

RUN yum update -y
RUN yum install -y epel-release
RUN yum install -y \
    unzip \
    supervisor
RUN yum clean all

RUN curl -O -k -L http://downloads.sourceforge.net/project/lportal/Liferay%20Portal/6.2.5%20GA6/liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip \
 && unzip liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip -d /opt \
 && rm liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip
RUN ln -s /opt/liferay-portal-6.2-ce-ga6 /opt/liferay \
 && ln -s /opt/liferay/tomcat-7.0.62 /opt/liferay/tomcat

COPY assets/supervisord.conf /etc/supervisord.conf
COPY assets/init.sh /opt/liferay/init.sh

VOLUME ["/opt/liferay"]

EXPOSE 8080

CMD /usr/bin/supervisord -n
