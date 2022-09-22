# Copyright IBM Corp. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0

ARG GO_VER=1.16
ARG ALPINE_VER=3.16.2

FROM golang:${GO_VER}-alpine${ALPINE_VER}
# FROM golang:1.16-alpine

# Set the Current Working Directory inside the container
WORKDIR /tmp/chaincode-external
# Copy local code to the container image.
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

EXPOSE 9999
CMD ["chaincode-external"]
