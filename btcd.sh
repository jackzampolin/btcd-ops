#!/bin/bash

DIR="$HOME/.btcd"

if [ "$1" == "start" ]; then
  $HOME/go/bin/btcd 1>> "$DIR/btcd_stdout.log" 2>> "$DIR/btcd_stderr.log" & echo $! > "$DIR/btcd.pid"
elif [ "$1" == "stop" ]; then
  kill -SIGINT $(cat "$DIR/btcd.pid")
elif [ "$1" == "logs" ]; then
  tail -f "$DIR/btcd_stdout.log"
else
  echo "btcd {{ start | stop | logs }}"
fi
