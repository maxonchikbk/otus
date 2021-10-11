FROM alpine:latest
RUN apk update && apk upgrade && apk add nginx 
COPY static /usr/share/nginx/html
COPY ./site.conf /etc/nginx/http.d/default.conf
EXPOSE 80
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]