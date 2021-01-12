#!/bin/sh -eu

PKG="$1"
DST="$2"

GO_LDFLAGS="-linkmode external -extldflags \"-static\""
GO_BUILDMODE="pie"

CC=musl-gcc
export CC
CGO_ENABLED=1
export CGO_ENABLED

go build --ldflags "$GO_LDFLAGS" -trimpath -buildmode "$GO_BUILDMODE" -o "$DST" "$PKG"
go mod tidy
strip "$DST"

>&2 file "$DST"
>&2 du -h "$DST"

echo "$DST"
