#!/bin/bash
 
HOSTS_FILE=/etc/hosts
 
IFS="
"
sudo sed -i '/ip/,/ip/d' ${HOSTS_FILE}
sudo sed -i '/### BEGIN/,/### END/d' ${HOSTS_FILE}
 
sudo sed -i "$ a\\#### BEGIN HADOOP CLUSTER ####" ${HOSTS_FILE}
 
for fqdn in `cat ~/deploy/fqdn`
do
  sudo sed -i "$ a\\${fqdn}" ${HOSTS_FILE}
done
 
sudo sed -i "$ a\\#### END HADOOP CLUSTER ####" ${HOSTS_FILE}
