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
		krb5-workstation \
		podman-compose \
		python3-ramalama \
		qemu-user-static \
		tmate tmux \
		vim-enhanced \
		virt-install \
		virt-manager \
		virt-top \
		virt-viewer

# These packages for Automotive Stream Distribution development
RUN \
	dnf -y install \
		automotive-image-builder \
		make \
		osbuild \
		osbuild-auto \
		osbuild-ostree \
		osbuild-selinux \
		osbuild-tools \
		osbuild-luks2 \
		osbuild-lvm2 \
		python3-libselinux \
		rsync

