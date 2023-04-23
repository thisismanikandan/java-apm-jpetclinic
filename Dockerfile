FROM adoptopenjdk/openjdk11:jre-11.0.18_10
ADD spring-petclinic-2.5.0-SNAPSHOT.jar /home
RUN mkdir -p /home/apm
COPY apminsight-javaagent.jar /home/apm 
COPY apminsight.conf /home/apm
WORKDIR /home
ENTRYPOINT ["java","-javaagent:/home/apm/apminsight-javaagent.jar","-jar","spring-petclinic-2.5.0-SNAPSHOT.jar"]