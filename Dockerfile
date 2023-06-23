# Build Stage
FROM amazoncorretto:17-alpine AS base-build

# Update packages
RUN apk update && apk upgrade && apk --no-cache add bash


WORKDIR /usr/app

# Get gradle distribution
COPY ./*.gradle ./

COPY gradle/ ./gradle

RUN ./gradlew --version

# Build java project
COPY gradlefiles/ ./gradlefiles/

COPY src/ ./src/

RUN ./gradlew build \
    && rm -rf /usr/app/src /usr/app/gradlefiles /usr/app/*.gradle /usr/app/gradle /usr/app/gradlew

# Run Stage
FROM amazoncorretto:17-alpine AS release-build

# Copy spring boot jar file
WORKDIR /usr/app

COPY --from=base-build /usr/app/build/libs/dpp-mx-digital-pharmacy-gateway*.jar ./dpp-mx-digital-pharmacy-gateway.jar

# Run spring boot application
CMD ["java", "-jar", "dpp-mx-digital-pharmacy-gateway.jar"]

