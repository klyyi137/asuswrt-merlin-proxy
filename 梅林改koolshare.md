# 梅林改koolshare

## 常用命令
```
# 编辑文件，按i编辑，退出编辑按ESC，:wq 保存并退出，:q! 不保存并退出。
vi /koolshare/ss/config.json

# 设置文件属性
chmod a+rx /jffs/scripts/*

# 查看系统版本号
uname -a
uname -m

# 查看系统分区信息
df -h

# 查看磁盘分区信息
fdisk -l

# 查看端口是否启用 t=TCP协议，l=监听端口,p=PID，n=数字显示端口
netstat -tlpn | grep 1091

# iptables 查看转发规则是否生效
iptables -nvL --line-numbers | grep 1091

# 重载进程 PID=4034
kill -HUP 4034

# 查看进程的完整 cmdline（\0 替换为空格）  PID=11422
tr '\0' ' ' < /proc/11422/cmdline; echo

# 按文件内容搜索
grep -r ":1091" /koolshare
```

## 梅林改下载地址
```
https://fw.koolcenter.com/
```

## fancyss - 科学上网

**插件相关**
```
# fancyss插件下载地址
https://github.com/hq450/fancyss

# kcptun二进制文件解压地址(使用fancyss提供的kcptun客户端)
/koolshare/bin/kcptun
```

**使用自己下载的kcptun**
修改``vi /jffs/scripts/services-start``，设置开机启动。
```
#!/bin/sh

/koolshare/bin/kcptun -c /koolshare/kcptun/kcptun.json
```

**kcptun配置文件**
```
{
  "smuxver": 2, 
	"localaddr": "0.0.0.0:1091",
	"remoteaddr": "ip:12315-13315",
	"key": "123456",
	"crypt": "salsa20",
	"mode": "fast",
	"conn": 1,
	"mtu": 1200,
	"sndwnd": 1024,
	"rcvwnd": 1024,
	"nocomp": true
}
```

**使用插件自带KCPTUN作为网桥**
```
插件默认kcptun本地地址固定为 127.0.0.1:1091 ，只接收本地转发来的数据。
可选：接收外部数据需修改 /koolshare/ss/ssconfig.sh , 将 127.0.0.1:1091 修改为 0.0.0.0:1091 
```

**可选：允许外网访问KCPTUN**
修改``vi /jffs/scripts/firewall-start``，设置开机自动开放kcptun端口。
```
#!/bin/sh

iptables -I INPUT -p tcp --dport 1091 -j ACCEPT
iptables -I OUTPUT -p tcp --sport 1091 -j ACCEPT
```
