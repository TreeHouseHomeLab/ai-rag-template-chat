FROM nginx:1.17.2-alpine AS build

COPY nginx /etc/nginx

RUN touch ./off \
  && chmod o+rw ./off \
  && echo "mia_template_service_name_placeholder: $COMMIT_SHA" >> /etc/nginx/commit.sha

WORKDIR /usr/static

COPY ./build .

USER nginx

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]