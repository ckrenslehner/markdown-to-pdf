FROM alpine:latest

# Typst version 0.12 is needed for emoji support. Therefore, edge is used.
RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache \
    font-noto \
    font-noto-emoji \
    typst@edge \ 
    pandoc

# Copy templates from the local template folder to the appropriate location for pandoc.
COPY templates/*.typst /root/.local/share/pandoc/templates/

WORKDIR /data

# Set pandoc as the entrypoint. Same as in official pandoc docker image.
ENTRYPOINT ["/usr/bin/pandoc"]