FROM gentoo/stage3-amd64-nomultilib:20191208

COPY make.conf /etc/portage/make.conf
COPY package.mask /etc/portage/package.mask
COPY --from=gentoo/portage:20191208 /var/db/repos/gentoo /var/db/repos/gentoo
COPY ./distfiles/stage1/* /var/cache/distfiles/

RUN eselect news read > /dev/null; \ 
	emerge -uDN --keep-going @world; \
	emerge @preserved-rebuild; \
	emerge -c; \
	rm -rf /var/cache/distfiles/*

COPY ./distfiles/stage2/* /var/cache/distfiles/
COPY ./patches /etc/portage/patches
COPY ./repos /var/db/repos/gentoo

RUN emerge \
	=sci-libs/tensorflow-1.14.0-r2 \
	=sci-visualization/tensorboard-1.14.0 \
	=sci-libs/tensorflow-estimator-1.14.0; \
	rm -rf /var/cache/distfiles/*
