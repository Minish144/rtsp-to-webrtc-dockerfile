FROM golang:latest

WORKDIR /RTSPtoWebRTC

RUN git clone https://github.com/deepch/RTSPtoWebRTC.git .

RUN go mod download

ENV GO111MODULE=on

RUN go build -o start

EXPOSE 8083

CMD ./start