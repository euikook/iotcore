from certbot/certbot:latest

COPY ./entrypoint.sh /certbot/entrypoint.sh
COPY ./certbot-renew.sh /etc/periodic/daily/certbot-renew.sh

COPY --from=ghcr.io/ufoscout/docker-compose-wait:latest /wait /usr/bin/wait

WORKDIR /certbot

ENTRYPOINT [ "/certbot/entrypoint.sh" ]

