#!/bin/sh
PATH="/usr/sbin:/usr/bin:/sbin:/bin"
count=0
while :
do
	ping -c 1 -W 1 -q www.baidu.com 1>/dev/null 2>&1
	if [ "$?" == "0" ]; then
		/etc/init.d/AdGuardHome reload
		break
	fi
	sleep 5
	ping -c 1 -W 1 -q www.google.com 1>/dev/null 2>&1
	if [ "$?" == "0" ]; then
		/etc/init.d/AdGuardHome reload
		break
	fi
	sleep 5
	count=$((count+1))
	if [ $count > 18 ]; then
		/etc/init.d/AdGuardHome reload
		break
	fi
done
return 0