# Copyright The Shipwright Contributors
#
# SPDX-License-Identifier: Apache-2.0

ARG BASE

FROM ${BASE}
RUN \
  dnf --assumeyes --nodocs install git git-lfs && \
  dnf clean all && \
  rm -rf /var/cache/yum /var/cache/dnf /var/tmp/*

USER 1000:1000
