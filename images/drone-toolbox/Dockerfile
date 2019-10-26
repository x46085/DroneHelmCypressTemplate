FROM alpine:3.9
LABEL maintainer="daniel@m10.io"

RUN adduser -D -H -u 1000 -s /bin/bash node
ARG NODE_HOME=/home/node

# Update and install node / yarn to make this a "node alpine" image:
RUN apk update
RUN apk add nodejs nodejs-npm yarn

# Our services use google protocal buffers, install the compiler:
RUN apk --no-cache add libc6-compat
RUN ln -s /lib/libc.musl-x86_64.so.1 /lib/ld-linux-x86-64.so.2
RUN apk add protobuf

# Install common tools used in package build scripts:
RUN apk add make python git bash jq postgresql-client curl openssh netcat-openbsd tini
RUN apk add libstdc++ binutils-gold gcc g++ gnupg libgcc linux-headers

# Health probe for grpc servers, used with kubernetes liveness + readiness probes
RUN GRPC_HEALTH_PROBE_VERSION=v0.2.1 && \
    wget -qO/bin/grpc_health_probe https://github.com/grpc-ecosystem/grpc-health-probe/releases/download/${GRPC_HEALTH_PROBE_VERSION}/grpc_health_probe-linux-amd64 && \
    echo '8a76b2cc27488a528ad9f562804cab352005ac35bced1c9f140e47ced0b104a8  /bin/grpc_health_probe' | sha256sum -c && \
    chmod +x /bin/grpc_health_probe

WORKDIR ${NODE_HOME}/srv
