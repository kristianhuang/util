# go version
# FROM golang:1.17.7-alpine3.15 AS builder

ENV GOPROXY=https://goproxy.cn \
    CGO_ENABLED=0 \
    GOOS=linux \
    TZ=Asia/Shanghai

WORKDIR /app

COPY go.mod .

RUN go mod tidy

COPY .. .

RUN go build -ldflags="-w -s" -a -installsuffix cgo -o APPNAME APPPATH

FROM scratch


WORKDIR /app

# 从 builder 镜像中二进制文件拷贝到目录中
COPY --from=builder /app/APPNAME /app/APPNAME

# 需要运行的命令
ENTRYPOINT ["/app/APPNAME"]

# 追加的命令
# CMD [...]

