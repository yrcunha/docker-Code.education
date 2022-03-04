FROM golang:alpine AS builder

WORKDIR /go
COPY main.go .
RUN go build /go/main.go

FROM scratch

COPY --from=builder /go/main /go/main

ENTRYPOINT ["/go/main"]