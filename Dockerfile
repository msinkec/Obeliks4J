FROM openjdk:13-alpine

COPY . /usr/src/Obelisk4J
WORKDIR /usr/src/Obelisk4J

RUN javac src/main/java/org/obeliks/*.java -d target/classes && \
    cp src/main/resources/* target/classes/org/obeliks/ && \
    jar -cef org.obeliks.Tokenizer obeliks.jar -C target/classes org

ENTRYPOINT ["java", "-jar", "obeliks.jar"]
