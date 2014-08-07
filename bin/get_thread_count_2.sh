#!/bin/bash


_process="$1"

if [ -z "$_process" ]
then
    echo 0
    exit 0
fi


_procnum_current=$$
_procnum_target=$(ps -ef|grep -v grep|grep "$_process"|tr -s ' '|cut -d ' ' -f 2,3|grep -v $_procnum_current|cut -d ' ' -f 1)
_procnum_target=$(echo "$_procnum_target"|head -n 1)
if [ -z "$_procnum_target" ]
then
    echo 0
    exit 0
fi


#_thrnum_target=$(ls /proc/"$_procnum_target"/task 2>/dev/null| wc -l)
#if [ -z "$_thrnum_target" ]
#then
#    _thrnum_target=$(ls /proc/"$_procnum_target"/task 2>/dev/null| wc -l)
#fi
#
#if [ -z "$_thrnum_target" ]
#then
#    echo 0
#else
#    echo $_thrnum_target
#fi

_thrnum_target=$(ps -eLF|grep -v grep|tr -s ' '|cut -d ' ' -f 2|grep "$_procnum_target"|wc -l)
if [ -z "$_thrnum_target" ]
then
    echo 11
else
    echo $_thrnum_target
fi


exit 0

