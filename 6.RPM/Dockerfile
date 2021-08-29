FROM nginx:latest
RUN apt-get update && apt-get install -y createrepo && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
RUN mkdir /repo
RUN createrepo /repo/
COPY ./repo/nginx-1.20.1-1.el8.ngx.x86_64.rpm /repo/ 
COPY ./repo/default.conf /etc/nginx/conf.d/
EXPOSE 80