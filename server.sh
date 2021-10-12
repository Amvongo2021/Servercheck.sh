#!/bin/bash

#DESCRIPTION: This script will check the new install server.
#Author: alain_mvongo@yahoo.com
#Date : April 2021

##CPU Check
CPU_N= `nproc`
if [ ${CPU_N} -lt 2 ]
then
echo "CPU check FAILED"
else
echo "CPU check PASS"
fi

## Memory Check
MEM= `free -m |grep Mem |awk '{print$2}'`
if [ ${MEM} -lt 2000 ]
then
echo "Memory check FAILED"
else
echo "Memory check PASS"
fi

## Check if files exist
if [ -f /etc/group ]
then
echo "File /etc/group exist"
else
echo "File /etc/group missing"
fi

if [ -f /etc/passwd ]
then
echo "File /etc/passwd exist"
else
echo "File /etc/passwd missing"
fi

if [ -f /etc/httpd ]
then
echo "File /etc/httpd exist"
else
echo "File /etc/httpd missing"
fi

if [ -f /etc/kubernetes ]
then
echo "File /etc/kubernetes exist"
else
echo "File /etc/kubernetes missing"
fi

## Check user puppet
id puppet
RC=$?
if [ ${RC} -eq 0 ]
then
echo "User puppet check PASS"
else
echo "User puppet check FAILED"
fi

## Kernel version
kernelVersion= `uname -r | awk -F "." '{print $1}'`
if [ ${kernelVersion} -ge 3 ]
then
echo "Kernel version check PASS"
else
echo "Kernel version check FAILED"
fi
