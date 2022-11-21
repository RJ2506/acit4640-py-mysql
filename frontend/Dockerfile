FROM nginx

RUN mkdir /etc/nginx/templates

WORKDIR /etc/nginx/templates

COPY default.conf.template .

WORKDIR /usr/share/nginx/html

COPY index.html ./index.html