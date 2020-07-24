FROM adoptopenjdk/maven-openjdk8:latest

COPY . /tmp/build
WORKDIR /tmp/build

RUN mvn clean package

ARG JAR_FILE=target/*.jar

RUN mkdir -p /app

COPY ${JAR_FILE} /app/app.jar

WORKDIR /app

RUN rm -rf /tmp/build

ENTRYPOINT ["java","-jar","/app/app.jar"]