# Use a minimal Alpine-based image as a base.
FROM alpine:latest

# Create the parent directory for volume mount points.
RUN ["mkdir", "/volumes"]

# Copy the entry point.
COPY --chown=root:root ["build/mutagen-entry", "/usr/bin/mutagen-entry"]

# Set the entry point.
ENTRYPOINT ["/usr/bin/mutagen-entry"]
