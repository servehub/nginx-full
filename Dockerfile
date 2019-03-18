FROM debian:buster

VOLUME ["/var/www"]
EXPOSE 80 443

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && \
    apt-get -y install git curl nginx-full && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["nginx", "-g", "daemon off;"]