#!/bin/bash
#Send msg by dingding Group

export LANG=en_US.UTF-8

location='阿里云BJ'

PRINTSERV="${location} $NOTIFY_HOSTALIAS $NOTIFY_HOSTADDRESS $NOTIFY_SERVICEDESC is $NOTIFY_SERVICESTATE

$NOTIFY_SERVICEOUTPUT\n$NOTIFY_LONGSERVICEOUTPUT
日期: $NOTIFY_SHORTDATETIME 
地址: $NOTIFY_HOSTADDRESS"

PRINTHOST="${location} $NOTIFY_HOSTALIAS $NOTIFY_HOSTADDRESS is $NOTIFY_HOSTSTATE

$NOTIFY_HOSTOUTPUT
日期: $NOTIFY_SHORTDATETIME
地址: $NOTIFY_HOSTADDRESS"

if [ "$NOTIFY_WHAT" == "SERVICE" ]; then
    # For Service notification
    msg=${PRINTSERV}
else
    # For Host notification
    msg=${PRINTHOST}
fi

token_url='https://oapi.dingtalk.com/robot/send?access_token=ea723ca5419a7f3084aa7b4c103aa0160a105385a3f9af9a5d5994f992876d6a'
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
