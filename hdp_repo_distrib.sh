#!/bin/bash
 
for target_host in `cat ~/deploy/host_list`
do
	ssh ${target_host} 'mkdir -p ~/deploy' && cat /etc/yum.repos.d/hdp.repo | ssh ${target_host} "cat > ~/deploy/hdp.repo && sudo mv ~/deploy/hdp.repo /etc/yum.repos.d/ "
done