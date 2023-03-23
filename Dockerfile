From maven:latest AS mybuild
WORKDIR /app/myapp
COPY . /app/myapp
RUN cd /app/myapp
RUN mvn clean install -Dskiptests

FROM openjdk:11
COPY --from=mybuild /app/myapp/target/spring-petclinic-2.7.0-SNAPSHOT.jar/
EXPOSE 8080
