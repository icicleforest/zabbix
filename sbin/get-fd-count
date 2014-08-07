#!/bin/bash

# zabbix  ALL= NOPASSWD: /bin/ls

_process="$1"
_type="$2"
_ls="sudo /bin/ls -l"

if [ -z "$_process" ]
then
    echo 0
    exit 0
fi


_procnum_current=$$
_procnum_target=$(ps -ef|grep -v grep|grep "$_process"|tr -s ' '|cut -d ' ' -f 2,3|grep -v $_procnum_current|cut -d ' ' -f 1|head -n 1)
if [ -z "$_procnum_target" ]
then
    echo 0
    exit 0
fi


_fd_all=$($_ls /proc/"$_procnum_target"/fd 2>/dev/null|tail -n +2)
# retry
if [ -z "$_fd_all" ]
then
    _fd_all=$($_ls /proc/"$_procnum_target"/fd 2>/dev/null|tail -n +2)
fi


if [ "$_type" = "all" ]
then
    _fdnum_target=$(echo "$_fd_all"|wc -l)
elif [ "$_type" = "socket" ]
then
    _fdnum_target=$(echo "$_fd_all"|grep "socket:"|wc -l)
elif [ "$_type" = "pipe" ]
then
    _fdnum_target=$(echo "$_fd_all"|grep "pipe:"|wc -l)
elif [ "$_type" = "file" ]
then
    _fdnum_target=$(echo "$_fd_all"|grep -v "socket:"|grep -v "pipe:"|wc -l)
else
    _fdnum_target=0
fi


echo $_fdnum_target
exit 0

