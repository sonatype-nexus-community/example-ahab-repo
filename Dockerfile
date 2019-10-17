FROM ubuntu:latest

RUN apt-get update && apt-get install -y ca-certificates

WORKDIR /tmp/ahab

COPY ahab .

RUN chmod +x ahab

RUN update-ca-certificates

RUN dpkg-query --show --showformat='${Package} ${Version}\n' | ./ahab chase
