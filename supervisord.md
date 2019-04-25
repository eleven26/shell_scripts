### supervisor

* `/etc/supervisord.d/frp.ini`
```
[program:frp]
process_name=(program_name)s_%(process_num)02d
command=/root/frp_0.20.0_linux_amd64/frps -c /root/frp_0.20.0_linux_amd64/frps.ini
directory=/root/frp_0.20.0_linux_amd64
autostart=true
autorestart=true
user=root
numprocs=1
redirect_stderr=true
stdout_logfile=/var/log/frp.log
```

* 安装
  * `yum install supervisor`
  * `systemctl start supervisord`
  * `systemctl disable firewalld`

* 启动
  * `supervisorctl start frp:*`