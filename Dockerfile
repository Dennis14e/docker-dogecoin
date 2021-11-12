FROM debian:buster-slim AS builder

# Arguments
ARG DEBIAN_FRONTEND="noninteractive"

# Workdir
WORKDIR /opt

# Install dependencies
RUN apt-get update && \
    apt-get install -y ca-certificates wget && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

COPY dl-dogecoin.sh .

RUN chmod +x dl-dogecoin.sh && \
    ./dl-dogecoin.sh


FROM debian:buster-slim AS release

# Arguments
ARG DEBIAN_FRONTEND="noninteractive"

# Labels
LABEL maintainer="Dennis Neufeld <git@dneufeld.net>" \
      version="1.14.5-1" \
      description="Dogecoin Node"

# Workdir
WORKDIR /opt

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl gnupg && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

# Copy Dogecoin installation from builder
COPY --from=builder /opt/dogecoin dogecoin

# Create data dir
RUN mkdir -p /opt/dogecoin-data

# Expose port
EXPOSE 22556/tcp

# Run
CMD [ "/opt/dogecoin/bin/dogecoind", "-datadir=/opt/dogecoin-data/", "-printtoconsole", "-shrinkdebugfile" ]
