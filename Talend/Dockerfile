
#

# Oracle Java 8 Dockerfile

#

# https://github.com/cogniteev/docker-oracle-java

# https://github.com/cogniteev/docker-oracle-java/tree/master/oracle-java8

#



# Pull base image.

FROM ubuntu



# Install Java.

RUN \

  apt-get install -y software-properties-common && \

  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \

  add-apt-repository -y ppa:webupd8team/java && \

  apt-get update && \

  apt-get install gnome-schedule -y && \ 

  apt-get install -y oracle-java8-installer && \ 



  rm -rf /var/lib/apt/lists/* && \

  rm -rf /var/cache/oracle-jdk8-installer





# Define working directory.

WORKDIR /data



# Define commonly used JAVA_HOME variable

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

#Couch
#ADD TestCouch2SF_0.1 /data/TestCouch2SF_0.1
ADD Couch /data/Couch
#CMD ["tail -f /dev/null"]
# Define default command.

#ENTRYPOINT ["/data/TestCouch2SF_0.1/TestCouch2SF/TestCouch2SF_run.sh"]
CMD ["(crontab -l 2>/dev/null; echo "*/5 * * * * /data/couch/Couch_Sync_Data/Couch_Sync_Data_run.sh") | crontab -)"] 
CMD ["sh","/data/Couch/Couch_Sync_Data/Couch_Sync_Data_run.sh"]
#CMD ["(crontab -l 2>/dev/null; echo "*/5 * * * * /data/couch/Couch_Sync_Data/Couch_Sync_Data_run.sh") | crontab -)"]
#CMD ["tail -f /dev/null"]
#ENTRYPOINT ["/bin/bash"]

