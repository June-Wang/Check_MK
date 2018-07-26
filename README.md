Check MK 安装文档
=================
##### 安装环境：Ubuntu 16.04.4 LTS 适用于所有基于Debian的发行版本
### Quick Start ###
1.配置ConSol Labs源:
```
gpg --keyserver keys.gnupg.net --recv-keys F8C1CA08A57B9ED7
gpg --armor --export F8C1CA08A57B9ED7 | apt-key add -
wget -q "https://labs.consol.de/repo/stable/RPM-GPG-KEY" -O - | sudo apt-key add -
echo "deb http://labs.consol.de/repo/stable/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/labs-consol-stable.list
apt-get update
```
2.安装OMD:
```
apt-get install omd -y
```
3.创建网站实例并启动:
```
omd create mk
omd start mk
```
