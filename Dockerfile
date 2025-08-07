FROM golang:1.22 AS builder

RUN apt-get update

RUN mkdir /build

COPY . /build

WORKDIR /build

RUN go build main.go

##########################

FROM golang:1.22

COPY --from=builder /build /app

WORKDIR /app

EXPOSE 5001

ENTRYPOINT ["./ghanapostgps"]
