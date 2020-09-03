#!/bin/bash
#Send msg by dingding Group

token_url='https://oapi.dingtalk.com/robot/send?access_token=XXX'
export LANG=en_US.UTF-8

location='阿里云'

PRINTSERV="${location}
$NOTIFY_HOSTALIAS $NOTIFY_SERVICEDESC is $NOTIFY_SERVICESTATE
IPAddr: $NOTIFY_HOSTADDRESS
Date: $NOTIFY_SHORTDATETIME
Message: $NOTIFY_SERVICEOUTPUT\n$NOTIFY_LONGSERVICEOUTPUT"

PRINTHOST="${location}
$NOTIFY_HOSTALIAS is $NOTIFY_HOSTSTATE
IPAddr:$NOTIFY_HOSTADDRESS
Date: $NOTIFY_SHORTDATETIME
Message: $NOTIFY_HOSTOUTPUT"

if [ "$NOTIFY_WHAT" == "SERVICE" ]; then
    # For Service notification
    msg=${PRINTSERV}
else
    # For Host notification
    msg=${PRINTHOST}
fi

curl "${token_url}" \
   -H 'Content-Type: application/json' \
   -d "{'msgtype': 'text', 
        'text': {
             'content': \"${msg}\"
        },
      'at': {
            'isAtAll': true
        }
      }"
