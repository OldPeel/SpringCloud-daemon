FROM openjdk:8-jdk-alpine
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
RUN "find / -name ${JAR_FILE} "
EXPOSE 10086
CMD " java -jar app.jar"