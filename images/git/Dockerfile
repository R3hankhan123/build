# Copyright The Shipwright Contributors
#
# SPDX-License-Identifier: Apache-2.0

ARG BASE

FROM ${BASE}

RUN dnf --assumeyes --nodocs install git curl && \
    # Temporarily set the crypto policy to LEGACY to allow SHA-1 signatures
    # WARNING: This lowers your system's security.
    update-crypto-policies --set LEGACY && \
    # Now try to add the Git LFS repository and install
    # (Using the explicit OS/distro for packagecloud.io as discussed previously,
    # as it might also contribute to signature issues if the wrong repo config is fetched)
    curl -sSL https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh?os=el&dist=10 | bash && \
    dnf --assumeyes --nodocs install git-lfs && \
    git lfs install && \
    # OPTIONAL BUT RECOMMENDED: Restore crypto policy to DEFAULT for better security
    # If other parts of your application or subsequent installs in this image
    # also require LEGACY, you might skip this line.
    update-crypto-policies --set DEFAULT && \
    # Clean up DNF cache and temporary files
    dnf clean all && \
    rm -rf /var/cache/yum /var/cache/dnf /var/tmp/*


USER 1000:1000
