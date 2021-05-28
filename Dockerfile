FROM golang:latest

WORKDIR /RTSPtoWebRTC

RUN git clone https://github.com/deepch/RTSPtoWebRTC.git .

RUN go mod download

ENV GO111MODULE=on

EXPOSE 8083

CMD go run *.go