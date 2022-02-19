FROM gradle:7-jdk8 AS builder

COPY . .
RUN gradle build

FROM gcr.io/distroless/java17-debian11

COPY --from=builder /home/gradle/build/libs/gradle-playground-all.jar /app.jar

CMD [ "/app.jar" ]