# Use OpenJDK 21 as the base image
FROM openjdk:21-jdk-slim

# Set environment variables for Tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Install necessary packages and download the latest version of Apache Tomcat
RUN apt-get update && \
    apt-get install -y wget curl && \
    LATEST_TOMCAT=$(curl -s https://tomcat.apache.org/download-90.cgi | grep -oP '(?<=v)[0-9.]+(?=/bin)') && \
    wget https://dlcdn.apache.org/tomcat/tomcat-9/v$LATEST_TOMCAT/bin/apache-tomcat-$LATEST_TOMCAT.tar.gz && \
    tar xzvf apache-tomcat-$LATEST_TOMCAT.tar.gz && \
    mv apache-tomcat-$LATEST_TOMCAT /usr/local/tomcat && \
    rm apache-tomcat-$LATEST_TOMCAT.tar.gz

# Expose the default Tomcat port
EXPOSE 8080

# Set the default command to run Tomcat
CMD ["catalina.sh", "run"]

