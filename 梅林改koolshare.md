## 常用命令
```
# 编辑文件，按i编辑，退出编辑按ESC，:wq 保存并退出，:q! 不保存并退出。
vi
# 设置文件属性
chmod a+rx /jffs/scripts/*
# 查看端口是否启用
netstat -antp | grep 8389
# iptables 查看转发规则是否生效
iptables -nvL --line-numbers | grep 8389
# 查看系统版本号
uname -a
# 查看应用适用系统版本
uname -m
# 查看系统分区信息
df -h
# 查看磁盘分区信息
fdisk -l 
```
