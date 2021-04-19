#!/bin/bash

#DESCRIPTION: This script will check the new install server.
#Author: alain_mvongo@yahoo.com
#Date : April 2021

##CPU Check
CPU_N= 'nproc'
if [${CPU_N} -lt 2]
then
echo "CPU check failed"
else
echo "CPU check pass"
fi

## Memory Check
MEM='free -m |grep Mem |awk '{print$2}''
if [${MEM} -lt 2000]
then
echo "Memory check failed"
else
echo "Meomry check pass"
fi

## Check if files exist
if [ -f /etc/group]
then
echo "File /etc/group pass"
else
echo "File /etc/group failed"
fi

if [ -f /etc/passwd]
then
echo "File /etc/passwd pass"
else
echo "File /etc/passwd failed"
fi

if [ -f /etc/httpd]
then
echo "File /etc/httpd pass"
else
echo "File /etc/httpd failed"
fi

if [ -f /etc/kubernetes]
then
echo "File /etc/kubernetes pass"
else
echo "File /etc/kubernetes failed"
fi

## Check user puppet
id puppet
RC=$?
if [${RC} -eq 0]
then
echo "User puppet check pass"
else
echo "User puppet check failed"
fi

## Kernel version
kernelVersion= 'uname -r | awk -f "." '{print $1}''
if [ ${kernelVersion} -ge 3]
then
echo "Kernel version check pass"
else
echo "Kernel version check failed"
fi
