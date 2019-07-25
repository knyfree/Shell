#!/bin/bash
 
echo "Clean up remote deploy ..."
 
for fqdn in `cat ~/deploy/hosts`
do
	echo "${fqdn} is cleaning..."
	ssh ${fqdn} 'rm -rf ~/deploy'
	ssh -t ${fqdn} 'sudo sed -i "s/^\#Banner/Banner/g" /etc/ssh/sshd_config'
	ssh -t ${fqdn} 'sudo sed -i "s/^\# Banner/Banner/g" /etc/ssh/sshd_config'
	echo "${fqdn} ........................... done"
done