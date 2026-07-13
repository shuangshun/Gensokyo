#!/bin/bash

set -e

OUTPUT="gensokyo.exe"
LDFLAGS="-s -w"

GOOS=windows GOARCH=amd64 go build \
    -trimpath \
    -ldflags="$LDFLAGS" \
    -o "$OUTPUT"

upx --best --compress-exports=1 --lzma "$OUTPUT"

ls -lh "$OUTPUT"

echo -e "\n\033[92mBUILD SUCCESSFUL: $OUTPUT\033[0m"
