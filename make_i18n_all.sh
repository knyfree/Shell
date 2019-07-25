#!/bin/bash
 
sudo sed -i 's/euckr/UTF-8/g' /etc/sysconfig/i18n
 
for fqdn in `cat ~/deploy/hosts`
do
	ssh -t ${fqdn} "sudo sed -i 's/euckr/UTF-8/g' /etc/sysconfig/i18n"
done