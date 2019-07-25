#!/bin/bash
 
LIMIT_CONF_FILE=/etc/security/limits.conf
 
IFS="
"
sudo sed -i '/### BEGIN/,/### END/d' ${LIMIT_CONF_FILE}
 
sudo sed -i "$ a\\#### BEGIN HADOOP CLUSTER ####" ${LIMIT_CONF_FILE}
 
  sudo sed -i "$ a\\*    hard nofile 65535" ${LIMIT_CONF_FILE}
  sudo sed -i "$ a\\*    soft nofile 65535" ${LIMIT_CONF_FILE}
  sudo sed -i "$ a\\*    hard nproc  65535" ${LIMIT_CONF_FILE}
  sudo sed -i "$ a\\*    soft nproc  65535" ${LIMIT_CONF_FILE}
 
sudo sed -i "$ a\\#### END HADOOP CLUSTER ####" ${LIMIT_CONF_FILE}
 
sudo sysctl -p