FROM golang:latest AS build

WORKDIR /RTSPtoWebRTC

RUN git clone https://github.com/deepch/RTSPtoWebRTC.git .

RUN go mod download

ENV GO111MODULE=on

RUN rm config.json
COPY config.json ./

RUN go build -o start

FROM scratch AS bin

COPY --from=build /RTSPtoWebRTC/start /start

EXPOSE 8083

CMD /start
