# Use a minimal Alpine-based image as a base.
FROM alpine:latest

# Create the parent directory for volume mount points.
RUN ["mkdir", "/volumes"]

# Copy the entry point.
COPY --chown=root:root ["build/mutagen-sidecar-entry", "/usr/bin/mutagen-sidecar-entry"]

# Set the entry point.
ENTRYPOINT ["/usr/bin/mutagen-sidecar-entry"]
