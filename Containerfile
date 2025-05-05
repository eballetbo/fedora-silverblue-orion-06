ARG releasever=42
ARG basearch=aarch64
ARG kernelver=6.15.0-0.rc2.1a1d569a75f3a.23.cix.fc42

FROM quay.io/fedora/fedora-bootc:${releasever}-${basearch}

COPY etc /etc
COPY usr /usr

RUN \
    dnf -y install \
		distrobox \
		git \
		podman-compose \
		vim-enhanced \
        kernel-${kernelver} \
        kernel-core-${kernelver} \
        kernel-modules-${kernelver}

RUN \
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    
RUN \
	systemctl enable libvirtd.service \
	&& \
	sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf \
	&& \
	systemctl enable rpm-ostreed-automatic.timer \
	&& \
	systemctl enable flatpak-system-update.timer \
	&& \
	rm -rf \
		/tmp/* \
		/var/* \
	&& \
	rpm-ostree cleanup -m \
	&& \
	ostree container commit
