FROM alpine

# wallet, p2p, and rpc
EXPOSE 8332 8333 8334

# testnet wallet, p2p, and rpc
EXPOSE 18332 18333 18334

# Need to have the relevant binaries built for linux in the $(pwd)/build folder
COPY build/ /usr/bin/

# Start the daemon
CMD ["btcd"]
