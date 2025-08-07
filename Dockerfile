# Stage 1: Build the binary
FROM golang:1.22 AS builder

# Set working directory inside builder
WORKDIR /app

# Copy source files
COPY . .

# Build the binary
RUN go build -o ghanapostgps main.go

# Stage 2: Create minimal final image
FROM golang:1.22

# Set working directory inside runtime image
WORKDIR /app

# Copy binary from builder stage to runtime image
COPY --from=builder /app/ghanapostgps .

# Entrypoint to run the binary
ENTRYPOINT ["./ghanapostgps"]
