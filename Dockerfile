# Use an OpenJDK image as the base
FROM openjdk:21-jdk-slim

# Install necessary packages
RUN apt-get update && apt-get install -y wget curl && \
    wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.93/bin/apache-tomcat-9.0.93.tar.gz && \
    tar xzvf apache-tomcat-9.0.93.tar.gz && \
    mv apache-tomcat-9.0.93 /usr/local/tomcat && \
    rm apache-tomcat-9.0.93.tar.gz

# Copy the WAR file to Tomcat's webapps directory
COPY target/CalculatorApp.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat server
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
