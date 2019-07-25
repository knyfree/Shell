#!/bin/bash
 
for fqdn in `cat ~/deploy/hosts`
do
  ssh -t ${fqdn} 'sudo rm /etc/yum.repos.d/*.repo && sudo mv /etc/yum.repos.d/default/CentOS-*.repo /etc/yum.repos.d && sudo rm -rf /etc/yum.repos.d/default && sudo yum repolist'
done