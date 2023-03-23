From maven:latest AS mybuild
WORKDIR usr/app/myapp
COPY . usr/app/myapp
RUN cd usr/app/myapp
RUN mvn clean install -Dskiptests

FROM openjdk:11-jdk-alpine
COPY --from=mybuild usr/app/myapp/target/spring-petclinic-2.7.0-SNAPSHOT.jar /
EXPOSE 8080
