FROM golang:1.11 as builder

WORKDIR /go/src/github.com/aaronflower/shippy-user-cli/user-cli

COPY . .

# RUN go get -u github.com/golang/dep/cmd/dep
# RUN dep init && dep ensure
# RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo .

FROM alpine:latest

RUN apk --no-cache add ca-certificates

RUN mkdir /app
WORKDIR /app
# COPY user.json /app/user.json
COPY ./user.cli .

# Run the binary as per usual! This time with a binary build in a separate container,
# with all of the correct dependencies and runtime libraries.
ENTRYPOINT ["./user.cli"]
CMD ["./user.cli"]
