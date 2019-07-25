#!/bin/bash
 
HOSTS_FILE=/etc/ssh/sshd_config
 
IFS="
"
 
#sudo sed -i 's/^Banner/\\#Banner/g' ${HOSTS_FILE}
 
for fqdn in `cat ~/deploy/hosts`
do
  ssh -t ${fqdn} "sudo sed -i 's/^Banner/\\#Banner/g' ${HOSTS_FILE}"
done