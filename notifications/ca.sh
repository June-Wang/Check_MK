#!/bin/bash
#Send msg by Cloud Alert

export LANG=en_US.UTF-8

if [ "$NOTIFY_WHAT" == "SERVICE" ]; then
    # For Service notification
    /omd/sites/mk/local/share/check_mk/notifications/ca_agent/bin/cloud_alert.sh "alarmName:$NOTIFY_NOTIFICATIONTYPE Service Alert: $NOTIFY_HOSTADDRESS/$NOTIFY_SERVICEDESC is $NOTIFY_SERVICESTATE" "alarmContent:$NOTIFY_HOSTALIAS/$NOTIFY_HOSTADDRESS/$NOTIFY_SERVICEDESC $NOTIFY_SERVICEOUTPUT Date/Time: $NOTIFY_SHORTDATETIME" "entityName:$NOTIFY_HOSTADDRESS/$NOTIFY_SERVICEDESC" "priority:$NOTIFY_SERVICESTATE" "app:$NOTIFY_CONTACTPAGER"
else
    # For Host notification
    /omd/sites/mk/local/share/check_mk/notifications/ca_agent/bin/cloud_alert.sh "alarmName:$NOTIFY_NOTIFICATIONTYPE Host Alert: $NOTIFY_HOSTADDRESS is $NOTIFY_HOSTSTATE" "alarmContent:$NOTIFY_HOSTNAME/$NOTIFY_HOSTADDRESS $NOTIFY_HOSTOUTPUT Date/Time: $NOTIFY_SHORTDATETIME" "entityName:$NOTIFY_HOSTADDRESS" "priority:$NOTIFY_HOSTSTATE" "app:$NOTIFY_CONTACTPAGER"
fi
