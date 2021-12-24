FROM  golang:1.16.12-alpine3.15  as builder
WORKDIR  /go/src
ENV GOPROXY=https://goproxy.io,direct
COPY  .  .
RUN  go  build  -o  web-server

FROM  alpine:3.15
WORKDIR  /root
COPY  --from=builder /go/src/web-server  .
EXPOSE 8080
ENTRYPOINT  ["./web-server"]