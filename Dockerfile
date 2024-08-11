FROM tomcat:9.0.81-jdk11-openjdk

# Copy the WAR file to the webapps directory of Tomcat
COPY target/CalculatorApp.war /usr/local/tomcat/webapps/

# Expose the port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
