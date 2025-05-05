ARG releasever=42
ARG basearch=aarch64

FROM quay.io/fedora/fedora-bootc:${releasever}-${basearch}

COPY etc /etc
COPY usr /usr

RUN \
    dnf -y install \
		distrobox \
		git \
		podman-compose \
		vim-enhanced

# This is needed for the latest kernel to be installed
# in the container, which is required to get better support
# for the custom Orion O6 kernel build.
RUN \
    dnf -y upgrade kernel
