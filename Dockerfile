FROM golang:1.22

# Set working directory
WORKDIR /app

# Copy everything into the container
COPY . .

# Build the Go binary
RUN go build -o ghanapostgps main.go

# Expose the port (optional, for clarity)
EXPOSE 5001

# Run the binary
ENTRYPOINT ["./ghanapostgps"]
