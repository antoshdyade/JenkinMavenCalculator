FROM openjdk:21-jdk-slim

# Install necessary packages and Tomcat
RUN apt-get update && \
    apt-get install -y wget curl && \
    wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.80/bin/apache-tomcat-9.0.80.tar.gz && \
    tar xzvf apache-tomcat-9.0.80.tar.gz && \
    mv apache-tomcat-9.0.80 /usr/local/tomcat && \
    rm apache-tomcat-9.0.80.tar.gz

# Set the working directory
WORKDIR /usr/local/tomcat

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["bin/catalina.sh", "run"]

