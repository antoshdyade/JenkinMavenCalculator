FROM openjdk:21-jdk-slim

# Install Tomcat
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.81/bin/apache-tomcat-9.0.81.tar.gz && \
    tar xzvf apache-tomcat-9.0.81.tar.gz && \
    mv apache-tomcat-9.0.81 /usr/local/tomcat && \
    rm apache-tomcat-9.0.81.tar.gz

# Expose the port
EXPOSE 8080

# Copy the WAR file to the Tomcat webapps directory
COPY target/*.war /usr/local/tomcat/webapps/

# Start Tomcat
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]

