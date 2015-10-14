Check_MK
========

##一、什么是OMD
###OMD的全称是The Open Monitoring Distribution，

官方网址是：http://omdistro.org/start
大家可以看看官方的团队介绍：
从左至右Lars Michelsen (NagVis), Wolfgang Barth (author of “Nagios. System- und Netzwerk-Monitoring”), Ge
rhard Lauer (Nagios - Das Praxisbuch), Mathias Kettner (Check_MK, Livestatus), Jrg Linge (pnp4nagios), 
Sven Nierlein (Thruk) and Stefan Hsl. 其团队成员可以说都是业内的重量级人物。

###从团队核心成员大家可以清楚的了解OMD监控系统的主要组成部分：

1、以Nagios为核心，用于任务的调度。

2、Check MK是基于Nagios的一个强力的扩展程序，接替Nagios负责数据采集和web管理（nagios只做任务调度），集成了众多的监控插件/模板并支持目前主流的操作系统（Windows、Centos、Debian、FreeBSD等）。

3、通过pnp4nagios和RDDtool进行监控项目的绘图

4、通过NagVis和Thruk进行设备和网络拓扑的展示

##二、查看Check MK演示

如果大家想感受一下Check MK，官方有一个展示Demo：

网址：http://demo.mathias-kettner.de/demo/check_mk/

用户名：demo823
密码：demo
##三、安装OMD
以Debian 7 x64为例：
###1、去官网下载deb包，http://files.omdistro.org/releases/debian_ubuntu/
目前最新版本是omd-1.20.wheezy.amd64.deb
###2、安装依赖包：

aptitude install apache2 libapache2-mod-php5 libgd2-xpm libgd2-xpm-dev \

rrdtool libapache2-mod-python libapache2-mod-fcgid libapache2-mod-proxy-html \

libdbi-dev libevent-2.0-5 dnsutils fping graphviz dialog curl time \

libgd2-xpm libnet-snmp-perl libperl5.14 libsnmp-perl libpython2.7 \

rpm php5 php5-cgi php5-cli php5-gd php5-mcrypt php5-sqlite php-pear \

rsync lcab snmp unzip xinetd python-ldap libradiusclient-ng2 libpcap0.8 \

libgsf-1-114 python-reportlab python-imaging poppler-utils

###3、安装OMD：
dpkg -i omd-1.20.wheezy.amd64.deb

###4、创建监控实例：
omd create mon

omd start mon

创建完毕后在浏览器中敲入：

http://localhost/mon

选取check mk选项

用户名：omdadmin

密码：omd
