FROM openjdk:8-jdk-alpine
ARG JAR_FILE
COPY tensquare_eureka_server-1.0-SNAPSHOT.jar app.jar
EXPOSE 10086
CMD " find / -name app.jar && java -jar app.jar"