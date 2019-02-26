#!/bin/bash

source /home/${SUDO_USER}/.bashrc.rdbox-hq

VPN_SERVER_ADDRESS=$1
echo "[INFO] VPN_SERVER_ADDRESS=${VPN_SERVER_ADDRESS}"

# initial setup for vpnclient
/usr/local/vpncmd/vpncmd localhost -client << EOS_RDBOX
NicCreate ${VPN_CLIENT_NIC_NAME}
AccountCreate ${VPN_CONNECTION_NAME} /SERVER:${VPN_SERVER_ADDRESS}:${VPN_SERVER_PORT} /HUB:${VPN_HUB_NAME} /USERNAME:${VPN_USER_NAME} /NICNAME:${VPN_CLIENT_NIC_NAME}
AccountRetrySet ${VPN_CONNECTION_NAME} /NUM:${VPN_RETRY_COUNT} /INTERVAL:${VPN_RETRY_INTERVAL}
AccountEncryptEnable ${VPN_CONNECTION_NAME}
AccountStartupSet ${VPN_CONNECTION_NAME}
AccountPasswordSet ${VPN_CONNECTION_NAME} /PASSWORD:${VPN_USER_PASS} /TYPE:standard
AccountConnect ${VPN_CONNECTION_NAME}
AccountStatusGet ${VPN_CONNECTION_NAME}
EOS_RDBOX

#
