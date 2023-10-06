FROM eclipse-temurin:17-jdk-alpine as base

# First build the app
FROM base as builder
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
COPY ./src ./src
RUN ./mvnw clean install

# Now run it
FROM base as runner 	
EXPOSE 8080
COPY --from=builder //target/*.jar /app/*.jar
ENTRYPOINT ["java", "-jar","/app/*.jar" ]