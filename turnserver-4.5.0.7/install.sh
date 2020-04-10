#!/bin/bash

# Epel installation script

yum -y install epel-release




yum -y install openssl
yum -y install telnet
yum -y install sqlite
  
for i in *.rpm ; do

  yum -y install ${i}
  ER=$?
  if ! [ ${ER} -eq 0 ] ; then
    rpm -Uvh ${i}
    ER=$?
    if ! [ ${ER} -eq 0 ] ; then
      rpm -ivh --force ${i}
      ER=$?
      if ! [ ${ER} -eq 0 ] ; then
        echo "ERROR: cannot install package ${i}"
        exit -1
      fi
    fi
  fi
done

echo SUCCESS !

