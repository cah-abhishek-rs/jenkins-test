# Build Stage
FROM amazoncorretto:17-alpine AS base-build

# Update packages
RUN apk update && apk upgrade && apk --no-cache add bash

# Copy certificate into image
COPY certs/CAH-Root-CA-PR1.cer ./certs/CAH-Root-CA-PR1.cer
RUN keytool -importcert -file /certs/CAH-Root-CA-PR1.cer -alias CAH-Root-CA-PR1 -cacerts -storepass changeit -noprompt

# Get gradle distribution
WORKDIR /usr/app
COPY *.gradle gradle.* gradlew ./
COPY gradle/ ./gradle
RUN ls -l
RUN chmod +x ./gradlew && ./gradlew --version

# Build java project
COPY gradlefiles/ ./gradlefiles/
COPY src/ ./src/

RUN ./gradlew build

RUN ls -l

# Run Stage
FROM amazoncorretto:17-alpine AS release-build

# Copy spring boot jar file
WORKDIR /usr/app

RUN ls -l 

COPY --from=base-build /usr/app/build/libs/dpp-mx-digital-pharmacy-gateway*.jar ./dpp-mx-digital-pharmacy-gateway.jar

RUN ls -l

# Expose spring application port
EXPOSE 8080

# Set default spring profile
ENV SPRING_PROFILES_ACTIVE=docker

# Run spring boot application
CMD ["java", "-jar", "dpp-mx-digital-pharmacy-gateway.jar"]

