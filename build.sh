#!/bin/bash

HOMEDIR=$GOPATH/src/github.com/jackzampolin/btcd-docker
BUILD=$HOMEDIR/build
BINDIR=$GOPATH/bin/linux_amd64
IMAGE=quay.io/blockstack/btcd
TAG=latest

mkdir -p $BUILD
export GOBIN=""
cd $GOPATH/src/github.com/btcsuite/btcd
git pull
glide i
GOOS=linux GOARCH=amd64 go install . ./cmd/...
cp $BINDIR/addblock $BUILD
cp $BINDIR/btcctl $BUILD
cp $BINDIR/btcd $BUILD
cp $BINDIR/findcheckpoint $BUILD
cp $BINDIR/gencerts $BUILD
cd $HOMEDIR

docker build -t $IMAGE:$TAG .
