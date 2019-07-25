#!/bin/bash
 
for fqdn in `cat ~/deploy/hosts`
do
	~/deploy/deploy_ssh.sh ${fqdn}
	scp -r ~/.ssh/* ${fqdn}:~/.ssh
	ssh ${fqdn} 'chmod 600 ~/.ssh/id_dsa'
	ssh ${fqdn} 'mkdir -p ~/deploy'
	scp -r *.* ${fqdn}:~/deploy
	ssh -t ${fqdn} 'chmod +x ~/deploy/*.sh'
 
	ssh -t ${fqdn} '~/deploy/deploy_fqdn.sh'
done
 