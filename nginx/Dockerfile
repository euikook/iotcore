from nginx:latest

COPY entrypoint.sh /docker-entrypoint-override.sh
COPY options-ssl-nginx.conf /etc/letsencrypt/options-ssl-nginx.conf


EXPOSE 80
STOPSIGNAL SIGQUIT

ENTRYPOINT [ "/docker-entrypoint-override.sh" ]

CMD ["nginx", "-g", "daemon off;"]
