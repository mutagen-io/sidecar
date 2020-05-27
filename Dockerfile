# Use an Alpine-based Go image for building the entry point. The Alpine-based Go
# images are smaller and available for more architectures than the main images.
# Since this Dockerfile is Linux-specific, it's fine to use a Linux-only tag.
FROM golang:alpine

# Disable cgo. This is less important since we're using an Alpine-based Go image
# for both our build and final image, but we still want to avoid any MUSL or
# glibc dependencies.
ENV CGO_ENABLED=0

# Copy the entry point source code.
COPY ["entry.go", "entry.go"]

# Build the entry point.
RUN ["go", "build", "-o", "/mutagen-entry", "entry.go"]

# Switch to a minimal Alpine-based image as a base.
FROM alpine:latest

# Create the parent directory for volume mount points.
RUN ["mkdir", "/volumes"]

# Copy the entry point.
COPY --from=0 /mutagen-entry /usr/bin/mutagen-entry

# Set the entry point.
ENTRYPOINT ["/usr/bin/mutagen-entry"]
