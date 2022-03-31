FROM node:lts-alpine

RUN apk --no-cache --update add ca-certificates \
  && ln -sf /bin/run-parts /usr/bin/run-parts \
  && update-ca-certificates

EXPOSE 8080

ARG CI_NAME=local
ENV CI_NAME=${CI_NAME}
ENV PORT=8080

WORKDIR /code
COPY . /code

CMD ["npm", "start"]
