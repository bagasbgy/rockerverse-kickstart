FROM rocker/verse

MAINTAINER R. Dimas Bagas Herlambang <bagasbgy@gmail.com>

COPY sh/add-users.sh /
COPY data/users.csv /

RUN apt update
RUN apt install -y whois

RUN chmod 777 /add-users.sh
RUN /add-users.sh
RUN rm add-users.sh users.csv

RUN usermod -aG sudo admin
