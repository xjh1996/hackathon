FROM  golang:1.16  as builder
WORKDIR  /go/src
ENV GOPROXY=https://goproxy.io,direct
COPY  .  .
RUN  go  build  -o  web-server

FROM  centos:latest
WORKDIR  /root
COPY  --from=builder /go/src/web-server  .
EXPOSE 8080
ENTRYPOINT  ["./web-server"]