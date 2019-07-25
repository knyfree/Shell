#!/bin/bash
 
TARGET_FILE=/etc/ssh/sshd_config
 
IFS="
"
 
for fqdn in `cat ~/deploy/hosts`
do
 ssh -t ${fqdn} "sudo sed -i 's/^\\#Banner/Banner/g' ${TARGET_FILE}"
 ssh -t ${fqdn} "sudo sed -i 's/^\\# Banner/Banner/g' ${TARGET_FILE}"
done