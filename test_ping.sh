#!/bin/bash
 
RESULT_FILE=test_ping_result.log
 
rm -rf ${RESULT_FILE}
touch ${RESULT_FILE}
 
TITLE="FQDN-DomainName"
echo   "------------------------------------------------" >> ${RESULT_FILE}
echo   "-    HADOOP CLUSTER PING TEST v 1.0   -" >> ${RESULT_FILE}
echo   "------------------------------------------------" >> ${RESULT_FILE}
printf "| No# | %-31s |RESULT|\n" $TITLE >> ${RESULT_FILE}
echo   "------------------------------------------------" >> ${RESULT_FILE}
 
num=1
for fqdn in `cat ~/deploy/hosts`
do
  ping -c 1 -w 2 ${fqdn} &> /dev/null
  if [ "$?" == "0" ] ; then 
    printf "|%5d| %-31s |  OK  |\n" $num ${fqdn} >> ${RESULT_FILE}
  else
    printf "|%5d| %-31s | NOK  |\n" $num ${fqdn} >> ${RESULT_FILE}
  fi
  num=`expr $num + 1`
done 
 
echo   "------------------------------------------------" >> ${RESULT_FILE}
 
cat ${RESULT_FILE}
