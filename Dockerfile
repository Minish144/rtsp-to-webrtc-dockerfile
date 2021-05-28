FROM golang:latest

WORKDIR /RTSPtoWebRTC

RUN git clone https://github.com/deepch/RTSPtoWebRTC.git .

RUN go mod download

CMD GO111MODULE=on go run *.go