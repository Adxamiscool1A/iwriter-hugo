#!/bin/bash

NODE_VERSION='24.9.0'
GO_VERSION='1.24.4'
HUGO_VERSION='0.148.2'

echo "USING NODE VERSION: $(node -v)"

echo "Installing Go $GO_VERSION..."
curl -sSOL https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz
tar -xzf go${GO_VERSION}.linux-amd64.tar.gz
export PATH=$PATH:$PWD/go/bin
rm -rf go${GO_VERSION}.linux-amd64.tar.gz
go version

echo "Installing Hugo $HUGO_VERSION..."
curl -sSOL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz
tar -xzf hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz
chmod +x hugo
export PATH=$PATH:$PWD
rm -rf hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz
hugo version

echo "Project setting up..."
npm run project-setup

echo "Installing project dependencies..."
npm install

echo "Running the build command..."
npm run build
