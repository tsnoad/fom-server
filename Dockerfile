FROM ubuntu:20.04

LABEL version="0.1"
LABEL description="This is a custom docker image for FOM server"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y apache2 php libapache2-mod-php php-cli postgresql php-pgsql ffmpeg nano && \
  rm -rf /var/lib/apt/lists/* && \
  apt clean

COPY start.sh /start.sh
CMD ["./start.sh"]

EXPOSE 80
