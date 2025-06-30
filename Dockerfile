ARG VERSION=v3.5.0

FROM node:20-buster-slim AS builder

ARG VERSION

WORKDIR /build

RUN apt-get update

RUN apt-get install -y git python3 build-essential

RUN git clone --branch $VERSION https://github.com/janoside/btc-rpc-explorer .

# Make sure we can pull git npm dependencies
RUN git config --global url."https://github.com/".insteadOf git@github.com:
RUN git config --global url."https://".insteadOf ssh://

RUN npm ci --production

RUN rm -rf .git

FROM node:20-buster-slim

USER 1000

WORKDIR /data

COPY --from=builder /build .

EXPOSE 3002

CMD [ "npm", "start" ]
