#!/bin/bash
# EMAIL FOR sendEmail
# Download sendEmail http://caspian.dotconf.net/menu/Software/SendEmail/
# Author: Alex wang Email:qq5910225@gmail.com

smtp_server="smtp.mail.com"
mail_from="admin@mail.com"
mail_user="user_name"
mail_password="user_password"
location='peking'

sendEmail="/usr/sbin/sendEmail -f ${mail_from} -s ${smtp_server} -t $NOTIFY_CONTACTEMAIL -xu ${mail_user} -xp ${mail_password} -o message-charset=utf-8 -o tls=auto"

PRINTSERV="echo -en ${location} $NOTIFY_HOSTALIAS $NOTIFY_SERVICEDESC is $NOTIFY_SERVICESTATE\nIP: $NOTIFY_HOSTADDRESS\nDate: $NOTIFY_SHORTDATETIME\nMessage: $NOTIFY_SERVICEOUTPUT\n$NOTIFY_LONGSERVICEOUTPUT\n"

PRINTHOST="echo -en ${location} $NOTIFY_HOSTALIAS is $NOTIFY_HOSTSTATE\nIP:$NOTIFY_HOSTADDRESS\nDate: $NOTIFY_SHORTDATETIME\nMessage: $NOTIFY_HOSTOUTPUT\n"

#echo "NOTIFY_WHAT:$NOTIFY_WHAT" 
#echo "NOTIFY_NOTIFICATIONCOMMENT:${NOTIFY_NOTIFICATIONCOMMENT}" 

if [ "$NOTIFY_WHAT" == "SERVICE" ]; then
# For Service notification
        ${PRINTSERV} |${sendEmail} -u "${location} $NOTIFY_HOSTALIAS/$NOTIFY_SERVICEDESC is $NOTIFY_SERVICESTATE" 
# For Host notification
else
        ${PRINTHOST} |${sendEmail} -u "${location} $NOTIFY_HOSTALIAS/$NOTIFY_NOTIFICATIONTYPE $NOTIFY_HOSTNAME is $NOTIFY_HOSTSTATE" 
fi
