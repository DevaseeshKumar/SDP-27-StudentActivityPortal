# Build stage
FROM maven:3.8.4-openjdk-17-slim AS build


# Copy the pom.xml and source code into the container
COPY pom.xml 
COPY src /src/*

# Run Maven to build the project (including JAR generation)
RUN mvn clean package

# Package stage
FROM openjdk:17-slim


# Copy the JAR file from the build stage into the final image
COPY --from=build /target/StudentActivityPortal-0.0.1-SNAPSHOT.jar StudentActivityPortal-0.0.1-SNAPSHOT.jar

# Expose port 8080
EXPOSE 8080

# Set the entry point to run the Spring Boot application
ENTRYPOINT ["java", "-jar", "StudentActivityPortal-0.0.1-SNAPSHOT.jar"]
