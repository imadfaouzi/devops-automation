# Use an official OpenJDK 17 runtime as the parent image
FROM adoptopenjdk/openjdk17:alpine-jre

# Expose the port your Spring Boot application will run on (change this if needed)
EXPOSE 8080

ADD target/devops-integration.jar devops-integration.jar

ENTRYPOINT ["java", "-jar", "devops-integration.jar"]
