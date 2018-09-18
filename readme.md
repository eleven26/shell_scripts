### mac 下搭建 frp 内网穿透服务(需要公网服务器)

* 下载 frp
    * https://github.com/fatedier/frp

* sudo cp frp.plist /Library/LaunchDaemons
* cd /path/to/frp-release
* cp frpc /usr/local/bin
* cp frpc.ini /etc

* 编辑 /etc/frpc.ini 文件, 修改对应配置
* sudo launchctl load -w /Library/LaunchDaemons/frp.plist