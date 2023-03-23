From maven:latest AS mybuild
WORKDIR /app
COPY . /app
RUN cd /app && mvn clean install -Dskiptests


FROM openjdk:11
COPY --from=mybuild /app/spring-petclinic-2.7.0-SNAPSHOT.jar /
EXPOSE 8080
