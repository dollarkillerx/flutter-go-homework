# Stage 1: Build stage
FROM --platform=linux/amd64 golang:1.23.2-alpine AS builder

RUN apk add --no-cache gcc
RUN apk add --no-cache build-base

# Set environment variables
ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

# Set working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files
COPY go.mod go.sum ./

# Download dependencies and clean up
RUN go mod download && go mod tidy

# Copy the source code
COPY . ./

# Build the application
RUN CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go build -o main cmd/main.go

# Stage 2: Run stage
FROM amd64/alpine:3.21.0

# Set working directory inside the container
WORKDIR /root/

# Copy the binary from the builder stage
COPY --from=builder /app/main .

# Expose the application port
EXPOSE 8181

# Command to run the application
CMD ["./main"]
