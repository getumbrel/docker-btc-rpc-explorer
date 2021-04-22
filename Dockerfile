ARG VERSION=v3.1.1

FROM node:12-buster-slim AS builder

ARG VERSION

WORKDIR /build

RUN apt-get update

RUN apt-get install -y git python3 build-essential

RUN git clone --branch $VERSION https://github.com/janoside/btc-rpc-explorer .

RUN npm ci --production

RUN rm -rf .git

FROM node:12-buster-slim

USER 1000

WORKDIR /data

COPY --from=builder /build .

EXPOSE 3002

CMD [ "npm", "start" ]
