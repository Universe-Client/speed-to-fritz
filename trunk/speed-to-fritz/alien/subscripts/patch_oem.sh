#!/bin/bash
 . $include_modpatch
	sed -i -e "/export CONFIG_ENVIRONMENT_PATH=\/proc\/sys\/urlader/a \
	echo firmware_version ${OEM} > \$CONFIG_ENVIRONMENT_PATH\/environment \
	echo my_ipaddress 192.168.178.1 > \$CONFIG_ENVIRONMENT_PATH\/environment" "${1}/etc/init.d/rc.S"
	grep -q "echo firmware_version ${OEM} >" "${1}/etc/init.d/rc.S" && echo "-- OEM set via Firmware to: $OEM" 
	grep -q "my_ipaddress 192.168.178.1 >" "${1}/etc/init.d/rc.S" && echo "-- OEM set via Firmware to: $OEM" 
 exit 0
