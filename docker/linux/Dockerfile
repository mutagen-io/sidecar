# Use a minimal Alpine-based image as a base.
FROM alpine:latest

# Set an environment variable to indicate that this is the Mutagen sidecar.
ENV MUTAGEN_SIDECAR=true

# Create the parent directory for volume mount points.
RUN ["mkdir", "/volumes"]

# Copy the entry point.
COPY --chown=root:root ["build/mutagen-sidecar-entry", "/usr/bin/mutagen-sidecar-entry"]

# Set the entry point.
ENTRYPOINT ["/usr/bin/mutagen-sidecar-entry"]
