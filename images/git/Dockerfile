# Copyright The Shipwright Contributors
#
# SPDX-License-Identifier: Apache-2.0

ARG BASE

FROM ${BASE}

RUN \
  microdnf clean all && \
  microdnf --assumeyes --nodocs install git curl gnupg ca-certificates && \
  curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | bash && \
  microdnf --assumeyes --nodocs install git-lfs && \
  microdnf clean all && \
  rm -rf /var/cache/yum /var/cache/dnf /var/tmp/*

USER 1000:1000
