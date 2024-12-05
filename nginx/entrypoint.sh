#!/bin/sh


[ -f /etc/letsencrypt/live/$DOMAIN/fullchain.pem ] || {
    mkdir -p /etc/letsencrypt/live/$DOMAIN

    openssl req -x509 -nodes -days 1 -sha256 \
        -newkey rsa:2048 -keyout /etc/letsencrypt/live/$DOMAIN/privkey.pem \
        -subj "/C=KR/ST=Seoul/L=Gangnam/O=ACME Inc./CN=DevOps/OU=acme.com" \
        -out /etc/letsencrypt/live/$DOMAIN/fullchain.pem
}

/docker-entrypoint.sh "$@"

