ARG releasever=42
ARG basearch=aarch64

FROM quay.io/fedora/fedora-bootc:${releasever}-${basearch}

COPY etc /etc
COPY usr /usr
COPY opt /opt

RUN \
    dnf -y install \
		distrobox \
		git \
		podman-compose \
		tmate tmux \
		vim-enhanced

