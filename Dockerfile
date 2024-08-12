# Use OpenJDK 21 as the base image
FROM openjdk:21-jdk-slim

# Set environment variables for Tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Install necessary packages and download Tomcat
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.93/bin/apache-tomcat-9.0.93.tar.gz && \
    tar xzvf apache-tomcat-9.0.93.tar.gz && \
    mv apache-tomcat-9.0.93 /usr/local/tomcat && \
    rm apache-tomcat-9.0.93.tar.gz

# Expose the default Tomcat port
EXPOSE 8081

# Set the default command to run Tomcat
CMD ["catalina.sh", "run"]

