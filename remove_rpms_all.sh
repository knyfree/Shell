#!/bin/bash
 
for fqdn in `cat ~/deploy/hosts`
do
	ssh -t ${fqdn} 'sudo rpm -e --nodeps snappy lzo'
done