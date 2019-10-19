FROM ubuntu:latest

RUN apt-get update && apt-get install -y ca-certificates curl

WORKDIR /tmp/ahab

RUN curl -o ahab -O -L  https://github.com/sonatype-nexus-community/ahab/releases/download/v0.0.7/ahab-linux.amd64-v0.0.7

RUN chmod +x ahab

RUN update-ca-certificates

RUN dpkg-query --show --showformat='${Package} ${Version}\n' | ./ahab chase
