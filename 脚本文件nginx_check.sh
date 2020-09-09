#在/usr/local/src添加检测脚本
# 该脚本说的就是，如果主服务器挂掉了，从服务器作为主服务器

#!/bin/bash
A=`ps -C nginx –no-header |wc -l`

if [ $A -eq0 ];then
  /usr/local/nginx/sbin/nginx
  sleep 2
  if [ `ps -C nginx --no-header |wc -l` -eq0 ];then
    killallkeepalived
  fi
fi
