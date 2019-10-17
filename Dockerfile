FROM ubuntu:latest

WORKDIR /tmp/ahab

RUN apt-get update && apt-get install -y ca-certificates curl

RUN curl https://github.com/sonatype-nexus-community/ahab/releases/download/v0.0.7/ahab-darwin.amd64-v0.0.7 --output ahab && chmod +x ahab

RUN update-ca-certificates

RUN dpkg-query --show --showformat='${Package} ${Version}\n' | ./ahab chase
