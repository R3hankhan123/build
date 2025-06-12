# Copyright The Shipwright Contributors
#
# SPDX-License-Identifier: Apache-2.0

ARG BASE

FROM ${BASE}

RUN dnf --assumeyes --nodocs install git curl && \
    curl -sSL https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | bash && \
    dnf --assumeyes --nodocs --nogpgcheck  install git-lfs && \
    git lfs install && \
    dnf clean all && \
    rm -rf /var/cache/yum /var/cache/dnf /var/tmp/*


USER 1000:1000
