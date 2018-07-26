#!/bin/bash
# sms peking

export LANG=en_US.UTF-8

java_bin='/home/nagios/jdk1.7.0_21/bin/java'
java_opt='-jar /usr/local/nagios/sms/lib/sendsms-1.1.jar 192.168.1.11 23000'

PRINTSERV="$NOTIFY_HOSTALIAS $NOTIFY_SERVICEDESC is $NOTIFY_SERVICESTATE|IP:$NOTIFY_HOSTADDRESS|Date: $NOTIFY_SHORTDATETIME|Msg: $NOTIFY_SERVICEOUTPUT"
PRINTHOST="$NOTIFY_HOSTALIAS is $NOTIFY_HOSTSTATE|IP:$NOTIFY_HOSTADDRESS|Date: $NOTIFY_SHORTDATETIME|Msg: $NOTIFY_HOSTOUTPUT"
#exit 0

if [ "$NOTIFY_WHAT" == "SERVICE" ]; then
    # For Service notification
    ${java_bin} ${java_opt} "$NOTIFY_CONTACTPAGER" "`echo ${PRINTSERV}|grep -oP '^.{1,250}'`"
else
    # For Host notification
    ${java_bin} ${java_opt} "$NOTIFY_CONTACTPAGER" "${PRINTHOST}"
fi
