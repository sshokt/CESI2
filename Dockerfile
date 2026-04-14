FROM debian:bookworm-slim

LABEL maintainer="Virgile Lefevre" \
      description="TP Docker Debian 13 - LAMP Apache PHP"

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y --no-install-recommends \
    apache2 \
    php \
    libapache2-mod-php \
    && rm -rf /var/lib/apt/lists/*

RUN rm -f /var/www/html/index.html

COPY site/ /var/www/html/

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
