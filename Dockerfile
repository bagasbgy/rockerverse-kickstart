FROM rocker/verse

MAINTAINER R. Dimas Bagas Herlambang <bagasbgy@gmail.com>

COPY addusers.sh /
COPY users.csv /

RUN apt update
RUN apt install -y whois

RUN chmod 777 /addusers.sh
RUN /addusers.sh
RUN rm addusers.sh users.csv

RUN usermod -aG sudo admin
