FROM pascalgrimaud/ubuntu
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# update
RUN apt-get -y update

# install java7
RUN apt-get install -y openjdk-7-jre
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

# install jboss
RUN wget -O /tmp/jboss-as-7.1.1.Final.tar.gz \
    http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz && \
    tar zxvf /tmp/jboss-as-7.1.1.Final.tar.gz -C /opt

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# configuration
RUN sed -i -r 's/jboss.bind.address.management:127.0.0.1/jboss.bind.address.management:0.0.0.0/' \
    /opt/jboss-as-7.1.1.Final/standalone/configuration/standalone.xml

ADD jboss_run.sh /jboss_run.sh
RUN chmod 755 /*.sh

EXPOSE 8080 9990
CMD ["/jboss_run.sh"]
