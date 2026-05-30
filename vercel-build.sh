#!/bin/bash
set -e

GO_VERSION='1.22.5'
HUGO_VERSION='0.148.2'

echo "Installing Go..."
curl -L -o go.tar.gz https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz
tar -xzf go.tar.gz
export PATH="$PWD/go/bin:$PATH"
go version

echo "Installing Hugo..."
curl -L -o hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz
tar -xzf hugo.tar.gz
chmod +x hugo
export PATH="$PWD:$PATH"
hugo version

echo "Building Hugo site..."
hugo --themesDir ../.. --gc --minify
