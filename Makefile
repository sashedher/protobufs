# Makefile for the protobufs project

.PHONY: proto server client help

# Default target
all: help

# Compile protobuf files
proto:
	@echo "Compiling protobufs..."
	@protoc --proto_path=proto --go_out=paths=source_relative:. --go-grpc_out=paths=source_relative,require_unimplemented_servers=false:. proto/user.proto

# Run the gRPC server
server:
	@echo "Starting gRPC server..."
	@go run cmd/userService/main.go

# Run the gRPC client
client:
	@echo "Running gRPC client..."
	@go run cmd/client/main.go

# Show help
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  proto       Compile the .proto files to generate Go code."
	@echo "  server      Run the gRPC server."
	@echo "  client      Run the gRPC client."
	@echo ""
	@echo "To run the application:"
	@echo "1. In one terminal, run 'make server'"
	@echo "2. In another terminal, run 'make client'"
