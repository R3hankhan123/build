# Copyright The Shipwright Contributors
#
# SPDX-License-Identifier: Apache-2.0

ARG BASE

FROM ${BASE}

RUN dnf --assumeyes --nodocs install git curl

# Step 2: Set crypto policy to LEGACY
# WARNING: This lowers your system's security.
RUN update-crypto-policies --set LEGACY

# Step 3: Add Git LFS repository
# (Using the explicit OS/distro for packagecloud.io)
RUN curl -sSL https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | bash

# Step 4: Install git-lfs
RUN dnf --assumeyes --nodocs install git-lfs

# Step 5: Initialize Git LFS
# This command needs 'git' to be installed and accessible.
RUN git lfs install

# Step 6: Restore crypto policy to DEFAULT (optional but recommended)
RUN update-crypto-policies --set DEFAULT

# Step 7: Clean up DNF cache and temporary files
RUN dnf clean all && \
    rm -rf /var/cache/yum /var/cache/dnf /var/tmp/*


USER 1000:1000
