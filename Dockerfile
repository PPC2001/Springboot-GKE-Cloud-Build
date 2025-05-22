# Use AdoptOpenJDK for Java 17
FROM eclipse-temurin:17-jdk-jammy as builder

# Set the working directory
WORKDIR /app

# Copy the pom.xml file
COPY pom.xml .

# Download all dependencies
RUN mvn dependency:go-offline -B

# Copy the project source
COPY src ./src

# Package the application
RUN mvn package -DskipTests

# Use a smaller runtime image
FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

# Copy the jar from the builder image
COPY --from=builder /app/target/*.jar app.jar

# Set the startup command to run the jar
ENTRYPOINT ["java", "-jar", "app.jar"]