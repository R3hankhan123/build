# Copyright The Shipwright Contributors
#
# SPDX-License-Identifier: Apache-2.0

ARG BASE

FROM ${BASE}

RUN \
  microdnf --assumeyes --nodocs install git curl gnupg ca-certificates && \
  ARCH=$(uname -m) && \
  case "$ARCH" in \
    x86_64)   LFS_ARCH=amd64 ;; \
    aarch64)  LFS_ARCH=arm64 ;; \
    ppc64le)  LFS_ARCH=ppc64le ;; \
    s390x)    LFS_ARCH=s390x ;; \
    *)        echo "Unsupported architecture: $ARCH"; exit 1 ;; \
  esac && \
  curl -L -o /tmp/git-lfs.rpm https://github.com/git-lfs/git-lfs/releases/download/v3.6.0/git-lfs-linux-${LFS_ARCH}-v3.6.0.rpm && \
  rpm -i /tmp/git-lfs.rpm && \
  rm -f /tmp/git-lfs.rpm && \
  microdnf clean all && \
  rm -rf /var/cache/yum /var/cache/dnf /var/tmp/*

USER 1000:1000
