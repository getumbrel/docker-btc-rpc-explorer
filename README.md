# docker-btc-rpc-explorer

[btc-rpc-explorer](https://github.com/janoside/btc-rpc-explorer) docker image, optimized to run on [umbrel](https://github.com/getumbrel/umbrel)

## Usage

1. Clone project locally:
```
git clone https://github.com/getumbrel/docker-btc-rpc-explorer.git
cd docker-btc-rpc-explorer
```

2. Build docker image:
```
docker build -t btc-rpc-explorer .
```

3. Run your docker:
  
You can use the following environment variables to connect to your local bitcoind daemon:

- `BTCEXP_BITCOIND_HOST` is set to `host.docker.internal` to allow your docker image to access your local host
- `BTCEXP_BITCOIND_PORT` can be set to `18332` for testnet, `18443` for regtest or `8332` for mainnet
- `BTCEXP_BITCOIND_USER` is your RPC user
- `BTCEXP_BITCOIND_PASS` is your RPC password
- `BTCEXP_HOST` is set to `0.0.0.0` to allow the btc-rpc-explorer to listen on local host network

```
docker run \
 -dp 3002:3002\
 -e "BTCEXP_BITCOIND_HOST=host.docker.internal"\
 -e "BTCEXP_BITCOIND_PORT=18332"\
 -e "BTCEXP_BITCOIND_USER=USER"\
 -e "BTCEXP_BITCOIND_PASS=PASSWORD"\
 -e "BTCEXP_HOST=0.0.0.0"\
 -it btc-rpc-explorer
```

4. Start exploring

```   
open http://localhost:3002/
```