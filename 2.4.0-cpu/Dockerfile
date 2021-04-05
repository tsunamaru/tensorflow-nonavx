FROM gentoo/stage3:amd64-nomultilib-20210402

COPY make.conf /etc/portage/make.conf
COPY package.mask /etc/portage/package.mask

RUN emerge-webrsync --revert 20210402; \
	eselect news read > /dev/null

RUN emerge -uDN @world; \
	emerge -c; \
	rm -rf /var/cache/distfiles/*

RUN emerge tensorflow; \
	FEATURES+="-usersandbox" emerge -n tensorflow; \
	rm -rf /var/cache/distfiles/*
