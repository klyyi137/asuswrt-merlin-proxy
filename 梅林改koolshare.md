# 梅林改koolshare

## 常用命令
```
# 编辑文件，按i编辑，退出编辑按ESC，:wq 保存并退出，:q! 不保存并退出。
vi /koolshare/ss/config.json

# 设置文件属性
chmod a+rx /jffs/scripts/*

# 查看系统版本号
uname -a

# 查看应用适用系统版本
uname -m

# 查看系统分区信息
df -h

# 查看磁盘分区信息
fdisk -l

# 查看端口是否启用 t=TCP协议,p=PID，n=数字显示端口
netstat -tlpn | grep 1091

# iptables 查看转发规则是否生效
iptables -nvL --line-numbers | grep 1091

# 重载进程 PID=4034
kill -HUP 4034

# 查看进程的完整 cmdline（\0 替换为空格）  PID=11422
tr '\0' ' ' < /proc/11422/cmdline; echo
```

**1.fancyss - 科学上网**
```
https://github.com/hq450/fancyss
```

**2.可选：允许外网访问KCPTUN**
创建firewall-start设置开机自动开放kcptun端口``vi /jffs/scripts/firewall-start``
```
#!/bin/sh

iptables -I INPUT -p tcp --dport 1091 -j ACCEPT
iptables -I OUTPUT -p tcp --sport 1091 -j ACCEPT
```
