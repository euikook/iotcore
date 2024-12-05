from nginx:latest

COPY entrypoint.sh /docker-entrypoint-override.sh


EXPOSE 80
STOPSIGNAL SIGQUIT

ENTRYPOINT [ "/docker-entrypoint-override.sh" ]

CMD ["nginx", "-g", "daemon off;"]
