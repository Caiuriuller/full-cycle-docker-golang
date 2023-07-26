FROM golang:1.18.8-alpine3.16 as multiStageBuild

COPY main.go /app/main.go

WORKDIR /app

RUN go build -o /test main.go

#Empty image
FROM scratch

WORKDIR /app

COPY --from=multiStageBuild /test /test

ENTRYPOINT ["/test"]