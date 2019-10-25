FROM alpine:3.6@sha256:66790a2b79e1ea3e1dabac43990c54aca5d1ddf268d9a5a0285e4167c8b24475
LABEL maintainer="daniel@m10.io"
LABEL description="Kubectl, Helm, GCloud"
LABEL base="alpine"

# Helm version: can be passed at build time
ARG HELM_VERSION
ARG HELM_SHA256
ENV HELM_VERSION ${HELM_VERSION:-v2.14.3}
ENV HELM_FILENAME helm-${HELM_VERSION}-linux-amd64.tar.gz
ENV HELM_SHA256 ${HELM_SHA256:-38614a665859c0f01c9c1d84fa9a5027364f936814d1e47839b05327e400bf55}

# GCloud SDK version: can be passed at build time
ARG GSDK_VERSION
ARG GCLOUD_SHA256
ENV GSDK_VERSION ${GSDK_VERSION:-268.0.0}
ENV GSDK_FILENAME google-cloud-sdk-${GSDK_VERSION}-linux-x86_64.tar.gz
ENV GCLOUD_SHA256 ${GCLOUD_SHA256:-bc8fa3a096421659d557b408d46dbbd565420d2f2cab99198ca0e8791f4d59a0}

ARG KUBECTL
ARG KUBECTL_SHA256
ENV KUBECTL_SHA256 ${KUBECTL_SHA256:-69cfb3eeaa0b77cc4923428855acdfc9ca9786544eeaff9c21913be830869d29}
ENV KUBECTL ${KUBECTL:-v1.16.1}

RUN apk add --no-cache curl bash ca-certificates jq python

RUN mkdir /google && chmod 777 /google \
  && curl -so /tmp/${HELM_FILENAME} http://storage.googleapis.com/kubernetes-helm/${HELM_FILENAME} \
  && echo "${HELM_SHA256}  /tmp/${HELM_FILENAME}" | sha256sum -c \
  && curl -so /tmp/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL}/bin/linux/amd64/kubectl \
  && echo "${KUBECTL_SHA256}  /tmp/kubectl" | sha256sum -c \
  && curl -so /google/${GSDK_FILENAME} https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${GSDK_FILENAME} \
  && echo "${GCLOUD_SHA256}  /google/${GSDK_FILENAME}" | sha256sum -c \
  && tar -zxvf /tmp/${HELM_FILENAME} -C /tmp \
  && mv /tmp/linux-amd64/helm /bin/helm \
  && chmod +x /tmp/kubectl \
  && mv /tmp/kubectl /bin/kubectl \
  && tar -zxvf /google/${GSDK_FILENAME} -C /google \
  && /google/google-cloud-sdk/install.sh --usage-reporting false --quiet \
  && rm -rf /tmp/*

# FOR TESTING, SERVICE ACCOUNT FILES:
# COPY kubeconfig kubeconfig
# RUN mkdir ~/.kube && cp kubeconfig ~/.kube/config
# COPY drone-gcp-key.json drone-gcp-key.json

# TO USE GCLOUD, ABOVE FILES MUST BE IN PLACE AND THIS COMMAND RUN:
# /google/google-cloud-sdk/bin/gcloud auth activate-service-account --key-file=drone-gcp-key.json

CMD ["sh"]
