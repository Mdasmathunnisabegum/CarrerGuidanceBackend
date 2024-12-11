# Step 1: Use an official OpenJDK image as the base image
FROM openjdk:17-jdk-slim AS build

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy the pom.xml and download dependencies (for faster builds)
COPY pom.xml .

# Step 4: Use Maven to build the application (skip tests for faster build)
RUN apt-get update && apt-get install -y maven
RUN mvn clean install -DskipTests

# Step 5: Copy the entire project and build the WAR file
COPY . .

# Step 6: Build the WAR file
RUN mvn clean package -DskipTests

# Step 7: Use a smaller base image to run the application
FROM openjdk:17-jdk-slim

# Step 8: Set the working directory in the container
WORKDIR /app

# Step 9: Copy the WAR file from the build stage into the container
COPY --from=build /app/target/GeneralService-0.0.1-SNAPSHOT.war /app/GeneralService.war

# Step 10: Expose port 8080 to the outside world
EXPOSE 8080

# Step 11: Command to run the Spring Boot application
ENTRYPOINT ["java", "-jar", "/app/GeneralService.war"]
