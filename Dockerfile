FROM golang:1.22 AS builder

RUN apt-get update

RUN mkdir /build

COPY . /build

WORKDIR /build

RUN go build main.go

##########################

FROM golang:1.22

COPY --from=builder /build /app

ENTRYPOINT ["/app"]
