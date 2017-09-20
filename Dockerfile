FROM jboss/wildfly:10.1.0.Final

USER root

# add management user to jboss wildfly 10 application server
RUN $JBOSS_HOME/bin/add-user.sh admin admin --silent

COPY ./zanata-config/ $JBOSS_HOME/

ENV HOME /home/jboss
RUN mkdir -p $HOME

# Wildfly should have its own volume, 
# otherwise data volume masks the WAR and configuration update.
VOLUME $JBOSS_HOME

# changing directory into wildfly's bin
WORKDIR $JBOSS_HOME/bin/

CMD ["sh", "-c", "./standalone-zanata.sh"]