#!/usr/bin/env sh

[ -f /etc/letsencrypt/live/$DOMAIN/fullchain.pem ] && {
    mkdir -p /etc/letsencrypt/live/$DOMAIN

    openssl req -x509 -nodes -days 1 -sha256 \
        -newkey rsa:2048 -keyout /etc/letsencrypt/live/$DOMAIN/privkey.pem \
        -subj "OU=$DOMAIN" \
        -out /etc/letsencrypt/live/$DOMAIN/fullchain.pem
}

/usr/bin/wait

certbot certonly --webroot --webroot-path=/var/www/certbot --dry-run -d $DOMAIN --email $EMAIL

tail -f /dev/null