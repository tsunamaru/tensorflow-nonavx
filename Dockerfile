FROM gentoo/stage3:amd64-nomultilib

COPY make.conf /etc/portage/make.conf
COPY package.mask /etc/portage/package.mask

RUN emerge-webrsync; \
	eselect news read > /dev/null

RUN emerge -uDN @world; \
	emerge -c; \
	rm -rf /var/cache/distfiles/*

COPY package.use /etc/portage/package.use

RUN wget -c http://developer.download.nvidia.com/compute/redist/cudnn/v8.0.5/cudnn-11.1-linux-x64-v8.0.5.39.tgz; \
	mv cudnn* /var/cache/distfiles; \
	emerge tensorflow; \
	FEATURES+="-usersandbox" emerge -n tensorflow; \
	rm -rf /var/cache/distfiles/*
