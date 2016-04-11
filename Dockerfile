FROM rsippl/centos-jdk

MAINTAINER Ralf Sippl <ralf.sippl@gmail.com>

RUN yum update -y
RUN yum install -y unzip
RUN yum clean all

RUN curl -O -k -L http://downloads.sourceforge.net/project/lportal/Liferay%20Portal/7.0.0%20GA1/liferay-portal-tomcat-7.0-ce-ga1-20160331161017956.zip \
    && unzip liferay-portal-tomcat-7.0-ce-ga1-20160331161017956.zip -d /opt \
    && rm liferay-portal-tomcat-7.0-ce-ga1-20160331161017956.zip

ADD assets/portal-bundle.properties /opt/liferay-portal-7.0-ce-ga1/portal-bundle.properties

VOLUME ["/var/liferay-home", "/opt/liferay-portal-7.0-ce-ga1/"]

EXPOSE 8080

CMD ["run"]

ENTRYPOINT ["/opt/liferay-portal-7.0-ce-ga1/tomcat-8.0.32/bin/catalina.sh"]
