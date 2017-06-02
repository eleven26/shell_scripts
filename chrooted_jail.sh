#! /bin/env bash

set -x

user=gdj

mkdir -p "/home/${user}"
ls -l /dev/{null,zero,stdin,stdout,stderr,random,tty}
mkdir -p "/home/${user}/dev/"
cd "/home/${user}/dev/"

mknod -m 666 null c 1 3
mknod -m 666 tty c 5 0
mknod -m 666 zero c 1 5
mknod -m 666 random c 1 8

chown root:root "/home/${user}"
chmod 0755 "/home/${user}"
ls -ld "/home/${user}"

mkdir -p "/home/${user}/bin"
cp -v /bin/bash "/home/${user}/bin/"

# todo
ldd /bin/bash
mkdir -p "/home/${user}/lib64"
cp -v /lib64/{libtinfo.so.5,libdl.so.2,libc.so.6,ld-linux-x86-64.so.2} "/home/${user}/lib64/"

useradd ${user}
passwd ${user}

mkdir "/home/${user}/etc"
cp -vf /etc/{passwd,group} "/home/${user}/etc/"


vim /etc/ssh/sshd_config
#define username to apply chroot jail to
#   Match User tecmint
#specify chroot jail
#   ChrootDirectory /home/test

service sshd restart

mkdir -p "/home/${user}/home/${user}"
chown -R ${user}:${user} /home/${user}/home/${user}
chmod -R 0700 /home/${user}/home/${user}

cp -v /bin/ls /home/${user}/bin/
cp -v /bin/date /home/${user}/bin/
cp -v /bin/mkdir /home/${user}/bin/

# todo
ldd /bin/ls
cp -v /lib64/{libselinux.so.1,libcap.so.2,libacl.so.1,libc.so.6,libpcre.so.1,libdl.so.2,ld-linux-x86-64.so.2,libattr.so.1,libpthread.so.0} /home/${user}/lib64/

vim /etc/ssh/sshd_config
#Enable sftp to chrooted jail
#   ForceCommand internal-sftp

service sshd restart
