#!/bin/bash
 
for fqdn in `cat ~/deploy/hosts`
do
        scp -r ~/deploy/deploy_ulimit.sh ${fqdn}:~/deploy
	ssh -t ${fqdn} '~/deploy/deploy_ulimit.sh'
done