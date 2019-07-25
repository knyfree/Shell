#!/bin/bash
 
for target_host in `cat ~/deploy/host_list`
do
	ssh ${target_host} 'mkdir -p ~/.ssh' && cat ~/.ssh/id_dsa.pub | ssh ${target_host} "cat >> ~/.ssh/authorized_keys && chmod 700 ~/.ssh && chmod 0644 ~/.ssh/* "
done