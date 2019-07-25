#!/bin/bash
 
for fqdn in `cat ~/deploy/hosts`
do
  scp -r ~/yum_repo ${fqdn}:~/
  ssh -t ${fqdn} 'sudo mkdir -p /etc/yum.repos.d/default && sudo mv /etc/yum.repos.d/CentOS-*.repo /etc/yum.repos.d/default'
  ssh -t ${fqdn} "sudo cp ~/yum_repo/*.repo /etc/yum.repos.d && sudo yum repolist"
done