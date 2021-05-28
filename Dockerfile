# -- build stage --
FROM golang:latest AS build

WORKDIR /RTSPtoWebRTC

RUN git clone https://github.com/deepch/RTSPtoWebRTC.git .

RUN go mod download

RUN rm config.json
COPY config.json ./

ENV CGO_ENABLED=0
ENV GO111MODULE=on

RUN  go build -o start .

# # -- run stage --
FROM scratch AS bin

COPY --from=build /RTSPtoWebRTC/web ./web
COPY --from=build /RTSPtoWebRTC/config.json ./
COPY --from=build /RTSPtoWebRTC/start ./

EXPOSE 8083

CMD ["/start"]
