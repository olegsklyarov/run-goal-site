FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY index.html /usr/share/nginx/html/
COPY oferta.html /usr/share/nginx/html/
COPY policy.html /usr/share/nginx/html/
COPY styles.css /usr/share/nginx/html/
COPY styles-contracts.css /usr/share/nginx/html/
COPY images/ /usr/share/nginx/html/images/

LABEL traefik.enable=true
LABEL traefik.http.routers.run_goal.rule=Host(`run-goal.olegsklyarov.ru`)
LABEL traefik.http.routers.run_goal.tls=true
LABEL traefik.http.routers.run_goal.entrypoints=websecure
LABEL traefik.http.routers.run_goal.tls.certresolver=mytlschallenge

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
