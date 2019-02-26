#!/bin/sh

RDBOX_CONFIG=../conf/rdbox-hq-vb.params

#
#--- DO NOT MODIFY UNDER THIS LINE ---
#

. $RDBOX_CONFIG

if ! [ -z "$HTTP_PROXY" ] ; then
	export http_proxy=$HTTP_PROXY
fi

if ! [ -z "$HTTPS_PROXY" ] ; then
	export https_proxy=$HTTPS_PROXY
fi

wget https://releases.hashicorp.com/vagrant/${VAGRANT_INSTALL_VERSION}/vagrant_${VAGRANT_INSTALL_VERSION}_x86_64.deb
dpkg -i vagrant_${VAGRANT_INSTALL_VERSION}_x86_64.deb
vagrant plugin install vagrant-disksize
vagrant plugin install vagrant-vbguest
vagrant -v
