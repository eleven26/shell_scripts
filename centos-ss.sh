 yum install m2crypto python-setuptools
 easy_install pip
 pip install shadowsocks

config=$(cat <<< EOF
{
"server":"your_server_ip",
"server_port":8000,
"local_port":1080,
"password":"your_passwd",
"timeout":600,
"method":"aes-256-cfb"
}
EOF
)

echo ${config} > /etc/shadowsocks.json