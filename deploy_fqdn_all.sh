#!/bin/bash
 
for fqdn in `cat ~/deploy./hosts`
do
    scp -r deploy_fqdn.sh fqdn hosts ${fqdn}:~/deploy
 
	#ssh -t ${fqdn} '~/deploy/make_fqdn.sh'
	#ssh -t ${fqdn} '~/deploy/make_hosts.sh'
	ssh -t ${fqdn} '~/deploy/deploy_fqdn.sh'
done
