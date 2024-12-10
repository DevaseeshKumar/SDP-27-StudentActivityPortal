# Build stage
FROM maven:3.8.4-openjdk-17-slim AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and source code into the container
COPY pom.xml . 
COPY src ./src

# Download dependencies and package the application
RUN mvn clean package -DskipTests

# Package stage
FROM openjdk:17-slim

# Set the working directory for the application in the final image
WORKDIR /app

# Copy the JAR file from the build stage into the final image
COPY --from=build /app/target/StudentActivityPortal-0.0.1-SNAPSHOT.jar app.jar

# Expose the port specified in application.properties
EXPOSE 1127


# Set the entry point to run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
