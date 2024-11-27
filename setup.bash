#!/bin/bash

source .env
source functions.sh

# NOTE: Get the folder path from "setup.bash" file and change the working directory
# to that path to avoid problems with relative paths. By Questor
SCRIPTDIR_V="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPTDIR_V"

mkdir -p $FOLDER_BACKUP

cp -R $FOLDER_CONFIG/* $FOLDER_BACKUP
# < -------------------

# > -------------------
# OpenShift (OKD) - Configuration/bootstrap files

# File ./install-config.yaml
f_ez_sed "<OKD_DOMAIN>" "$OKD_DOMAIN" "$FOLDER_CONFIG/install-config.yaml" 1
f_ez_sed "<OKD_SUBDOMAIN>" "$OKD_SUBDOMAIN" "$FOLDER_CONFIG/install-config.yaml" 1

# File ./registry_pv.yaml
f_ez_sed "<OKD_LAN_24>" "$OKD_LAN_24" "$FOLDER_CONFIG/registry_pv.yaml" 1
f_ez_sed "<OKD_SERVICES_LST_OCT>" "$OKD_SERVICES_LST_OCT" "$FOLDER_CONFIG/registry_pv.yaml" 1
f_ez_sed "<OKD_SERVICES_STRG_SZ>" "$OKD_SERVICES_STRG_SZ" "$FOLDER_CONFIG/registry_pv.yaml" 1

# File ./registry_pvc.yaml
f_ez_sed "<OKD_SERVICES_STRG_SZ>" "$OKD_SERVICES_STRG_SZ" "$FOLDER_CONFIG/registry_pvc.yaml" 1

# < -------------------

# > -------------------
# ISC DHCP server - DHCP service

# File ./dhcpd.conf
f_ez_sed "<OKD_BOOTSTRAP_LST_OCT>" "$OKD_BOOTSTRAP_LST_OCT" "$FOLDER_CONFIG/dhcpd.conf" 1
f_ez_sed "<OKD_BOOTSTRAP_MAC>" "$OKD_BOOTSTRAP_MAC" "$FOLDER_CONFIG/dhcpd.conf" 1
f_ez_sed "<OKD_DOMAIN>" "$OKD_DOMAIN" "$FOLDER_CONFIG/dhcpd.conf" 1
f_ez_sed "<OKD_SUBDOMAIN>" "$OKD_SUBDOMAIN" "$FOLDER_CONFIG/dhcpd.conf" 1
f_ez_sed "<OKD_LAN_24>" "$OKD_LAN_24" "$FOLDER_CONFIG/dhcpd.conf" 1
f_ez_sed "<OKD_MASTER_1_LST_OCT>" "$OKD_MASTER_1_LST_OCT" "$FOLDER_CONFIG/dhcpd.conf" 1
f_ez_sed "<OKD_MASTER_1_MAC>" "$OKD_MASTER_1_MAC" "$FOLDER_CONFIG/dhcpd.conf" 1
f_ez_sed "<OKD_MASTER_2_LST_OCT>" "$OKD_MASTER_2_LST_OCT" "$FOLDER_CONFIG/dhcpd.conf" 1
f_ez_sed "<OKD_MASTER_2_MAC>" "$OKD_MASTER_2_MAC" "$FOLDER_CONFIG/dhcpd.conf" 1
f_ez_sed "<OKD_MASTER_3_LST_OCT>" "$OKD_MASTER_3_LST_OCT" "$FOLDER_CONFIG/dhcpd.conf" 1
f_ez_sed "<OKD_MASTER_3_MAC>" "$OKD_MASTER_3_MAC" "$FOLDER_CONFIG/dhcpd.conf" 1
f_ez_sed "<OKD_SERVICES_LST_OCT>" "$OKD_SERVICES_LST_OCT" "$FOLDER_CONFIG/dhcpd.conf" 1
f_ez_sed "<OKD_WORKER_1_LST_OCT>" "$OKD_WORKER_1_LST_OCT" "$FOLDER_CONFIG/dhcpd.conf" 1
f_ez_sed "<OKD_WORKER_1_MAC>" "$OKD_WORKER_1_MAC" "$FOLDER_CONFIG/dhcpd.conf" 1
f_ez_sed "<OKD_WORKER_2_LST_OCT>" "$OKD_WORKER_2_LST_OCT" "$FOLDER_CONFIG/dhcpd.conf" 1
f_ez_sed "<OKD_WORKER_2_MAC>" "$OKD_WORKER_2_MAC" "$FOLDER_CONFIG/dhcpd.conf" 1

# < -------------------

# > -------------------
# ISC BIND 9 - DNS service

# File ./named.conf
f_ez_sed "<OKD_LAN_24>" "$OKD_LAN_24" "$FOLDER_CONFIG/named.conf" 1
f_ez_sed "<OKD_SERVICES_LST_OCT>" "$OKD_SERVICES_LST_OCT" "$FOLDER_CONFIG/named.conf" 1

# File ./named.conf.local
f_ez_sed "<OKD_DOMAIN>" "$OKD_DOMAIN" "$FOLDER_CONFIG/named.conf.local" 1
f_ez_sed "<OKD_SUBDOMAIN>" "$OKD_SUBDOMAIN" "$FOLDER_CONFIG/named.conf.local" 1
f_ez_sed "<OKD_LAN_24_REVERSE>" "$OKD_LAN_24_REVERSE" "$FOLDER_CONFIG/named.conf.local" 1

# File ./fw.okd_domain
f_ez_sed "<OKD_BOOTSTRAP_LST_OCT>" "$OKD_BOOTSTRAP_LST_OCT" "$FOLDER_CONFIG/fw.okd_domain" 1
f_ez_sed "<OKD_DOMAIN>" "$OKD_DOMAIN" "$FOLDER_CONFIG/fw.okd_domain" 1
f_ez_sed "<OKD_SUBDOMAIN>" "$OKD_SUBDOMAIN" "$FOLDER_CONFIG/fw.okd_domain" 1
f_ez_sed "<OKD_LAN_24>" "$OKD_LAN_24" "$FOLDER_CONFIG/fw.okd_domain" 1
f_ez_sed "<OKD_MASTER_1_LST_OCT>" "$OKD_MASTER_1_LST_OCT" "$FOLDER_CONFIG/fw.okd_domain" 1
f_ez_sed "<OKD_MASTER_2_LST_OCT>" "$OKD_MASTER_2_LST_OCT" "$FOLDER_CONFIG/fw.okd_domain" 1
f_ez_sed "<OKD_MASTER_3_LST_OCT>" "$OKD_MASTER_3_LST_OCT" "$FOLDER_CONFIG/fw.okd_domain" 1
f_ez_sed "<OKD_SERVICES_LST_OCT>" "$OKD_SERVICES_LST_OCT" "$FOLDER_CONFIG/fw.okd_domain" 1
f_ez_sed "<OKD_WORKER_1_LST_OCT>" "$OKD_WORKER_1_LST_OCT" "$FOLDER_CONFIG/fw.okd_domain" 1
f_ez_sed "<OKD_WORKER_2_LST_OCT>" "$OKD_WORKER_2_LST_OCT" "$FOLDER_CONFIG/fw.okd_domain" 1

# File ./rv.okd_domain
f_ez_sed "<OKD_BOOTSTRAP_LST_OCT>" "$OKD_BOOTSTRAP_LST_OCT" "$FOLDER_CONFIG/rv.okd_domain" 1
f_ez_sed "<OKD_DOMAIN>" "$OKD_DOMAIN" "$FOLDER_CONFIG/rv.okd_domain" 1
f_ez_sed "<OKD_SUBDOMAIN>" "$OKD_SUBDOMAIN" "$FOLDER_CONFIG/rv.okd_domain" 1
f_ez_sed "<OKD_MASTER_1_LST_OCT>" "$OKD_MASTER_1_LST_OCT" "$FOLDER_CONFIG/rv.okd_domain" 1
f_ez_sed "<OKD_MASTER_2_LST_OCT>" "$OKD_MASTER_2_LST_OCT" "$FOLDER_CONFIG/rv.okd_domain" 1
f_ez_sed "<OKD_MASTER_3_LST_OCT>" "$OKD_MASTER_3_LST_OCT" "$FOLDER_CONFIG/rv.okd_domain" 1
f_ez_sed "<OKD_SERVICES_LST_OCT>" "$OKD_SERVICES_LST_OCT" "$FOLDER_CONFIG/rv.okd_domain" 1
f_ez_sed "<OKD_WORKER_1_LST_OCT>" "$OKD_WORKER_1_LST_OCT" "$FOLDER_CONFIG/rv.okd_domain" 1
f_ez_sed "<OKD_WORKER_2_LST_OCT>" "$OKD_WORKER_2_LST_OCT" "$FOLDER_CONFIG/rv.okd_domain" 1

# < -------------------

# > -------------------
# HAProxy - load balancer service

# File ./haproxy.cfg
f_ez_sed "<OKD_BOOTSTRAP_LST_OCT>" "$OKD_BOOTSTRAP_LST_OCT" "$FOLDER_CONFIG/haproxy.cfg" 1
f_ez_sed "<OKD_LAN_24>" "$OKD_LAN_24" "$FOLDER_CONFIG/haproxy.cfg" 1
f_ez_sed "<OKD_MASTER_1_LST_OCT>" "$OKD_MASTER_1_LST_OCT" "$FOLDER_CONFIG/haproxy.cfg" 1
f_ez_sed "<OKD_MASTER_2_LST_OCT>" "$OKD_MASTER_2_LST_OCT" "$FOLDER_CONFIG/haproxy.cfg" 1
f_ez_sed "<OKD_MASTER_3_LST_OCT>" "$OKD_MASTER_3_LST_OCT" "$FOLDER_CONFIG/haproxy.cfg" 1
f_ez_sed "<OKD_WORKER_1_LST_OCT>" "$OKD_WORKER_1_LST_OCT" "$FOLDER_CONFIG/haproxy.cfg" 1
f_ez_sed "<OKD_WORKER_2_LST_OCT>" "$OKD_WORKER_2_LST_OCT" "$FOLDER_CONFIG/haproxy.cfg" 1

# < -------------------

exit 0
