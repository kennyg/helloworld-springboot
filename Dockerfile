FROM java:8

ADD /src /src
ADD /gradle /gradle
ADD build.gradle build.gradle
ADD ./gradlew ./gradlew

RUN ./gradlew build

ADD /build /build

ADD build/libs/hellworld-springboot-0.1.0.jar app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
