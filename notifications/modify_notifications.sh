#!/bin/bash

#sed -i 's/LONGDATETIME/SHORTDATETIME/g' /usr/share/check_mk/notifications/mail
find /omd/ -type f -name "mail"|xargs -r -i sed -i 's/LONGDATETIME/SHORTDATETIME/g' '{}'
