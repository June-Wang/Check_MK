#!/bin/bash
# SMS FOR LEFU Peking
# Author: Alex wang Email:qq5910225@gmail.com

export LANG=en_US.UTF-8

java_bin='/home/nagios/jdk1.7.0_21/bin/java'
java_opt='-jar /usr/local/nagios/sms/lib/sendsms-1.1.jar 192.168.1.11 23000'

SERV_STAT=`echo $NOTIFY_SERVICESTATE|sed 's/CRITICAL/UP-CRITICAL/'`
HOST_STAT=`echo $NOTIFY_HOSTSTATE|sed 's/CRITICAL/UP-CRITICAL/'`

#PRINTSERV="北京: $NOTIFY_HOSTALIAS $NOTIFY_SERVICEDESC is UP-$NOTIFY_SERVICESTATE\nIP: $NOTIFY_HOSTADDRESS\nDate: $NOTIFY_SHORTDATETIME\nMessage: $NOTIFY_SERVICEOUTPUT\n"

PRINTSERV="北京: $NOTIFY_HOSTALIAS $NOTIFY_SERVICEDESC is ${SERV_STAT}\nIP: $NOTIFY_HOSTADDRESS\nDate: $NOTIFY_SHORTDATETIME\nMessage: $NOTIFY_SERVICEOUTPUT\n"

#PRINTHOST="北京: $NOTIFY_HOSTALIAS is $NOTIFY_HOSTSTATE\nIP:$NOTIFY_HOSTADDRESS\nDate: $NOTIFY_SHORTDATETIME\nMessage: $NOTIFY_HOSTOUTPUT\n"

PRINTHOST="北京: $NOTIFY_HOSTALIAS is $HOST_STAT\nIP:$NOTIFY_HOSTADDRESS\nDate: $NOTIFY_SHORTDATETIME\nMessage: $NOTIFY_HOSTOUTPUT\n"
#exit 0


if [ "$NOTIFY_WHAT" == "SERVICE" ]; then
# For Service notification
        ${java_bin} ${java_opt} "$NOTIFY_CONTACTPAGER" "`echo ${PRINTSERV}|grep -oP '^.{1,250}'`"
# For Host notification
else
        ${java_bin} ${java_opt} "$NOTIFY_CONTACTPAGER" "${PRINTHOST}"
fi
