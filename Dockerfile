# Build Stage
FROM maven:3.8.4-openjdk-17 AS builder
COPY . /app
WORKDIR /app
RUN mvn clean package -DskipTests



# Run Stage
FROM eclipse-temurin:17-jre-alpine
COPY --from=builder /app/target/JenkinsDockerImage-0.0.1-SNAPSHOT.jar /app/JenkinsDockerImage-0.0.1-SNAPSHOT.jar

# Optionally extract layers for better caching (Spring Boot 2.3+)
RUN java -Djarmode=layertools -jar /app/JenkinsDockerImage-0.0.1-SNAPSHOT.jar extract
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/JenkinsDockerImage-0.0.1-SNAPSHOT.jar"]
