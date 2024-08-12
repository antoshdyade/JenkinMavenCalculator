# Use an official OpenJDK runtime as a parent image
FROM openjdk:21-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the jar file from the host to the container
COPY target/calculator-app.jar /app/calculator-app.jar

# Expose port 8080 (this remains the internal container port)
EXPOSE 8080

# Run the jar file
CMD ["java", "-jar", "calculator-app.jar"]
