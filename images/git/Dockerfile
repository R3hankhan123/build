# Copyright The Shipwright Contributors
#
# SPDX-License-Identifier: Apache-2.0

ARG BASE

FROM ${BASE}

RUN dnf install -y --nodocs git curl && \
    ARCH=$(uname -m | sed \
        -e 's/^x86_64$/linux-amd64/' \
        -e 's/^aarch64$/linux-arm64/' \
        -e 's/^ppc64le$/linux-ppc64le/' \
        -e 's/^s390x$/linux-s390x/') && \
    echo "Detected ARCH: $ARCH" && \
    GIT_LFS_VER="3.5.1" && \
    curl -sL "https://github.com/git-lfs/git-lfs/releases/download/v${GIT_LFS_VER}/git-lfs-${ARCH}-v${GIT_LFS_VER}.tar.gz" \
      | tar xz && \
    ./install.sh && \
    git lfs install && \
    rm -rf git-lfs-*-*/ && \
    dnf clean all && \
    rm -rf /var/cache/dnf /var/cache/yum /var/tmp/*


USER 1000:1000
