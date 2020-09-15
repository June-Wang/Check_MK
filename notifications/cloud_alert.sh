#!/bin/bash
#copy nagios to /usr/local/nagios/libexec
export LANG=en_US.UTF-8

#CUR_PATH=$(cd "$(dirname "$0")"; pwd)/ca_agent/bin
#cd $CUR_PATH
cd /omd/sites/mk/local/share/check_mk/notifications/ca_agent/bin

../jre/bin/java -cp ../lib:../lib/alert-agent-0.0.1-SNAPSHOT.jar:../lib/snmp4j-2.3.1.jar:../lib/commons-beanutils-1.8.0.jar:../lib/commons-collections-3.1.jar:../lib/commons-lang-2.5.jar:../lib/commons-logging-1.1.jar:../lib/ezmorph-1.0.6.jar:../lib/json-lib-2.4-jdk15.jar:../lib/log4j-1.2.12.jar:../lib/logkit-1.0.1.jar:../lib/uc-common-1.0.0.jar:  com.upyoo.agent.NagiosClient "$1" "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9"
