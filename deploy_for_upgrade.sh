#!/bin/sh
echo "1. Deploying all repo file to all nodes(ambari 2.2.2 based)."
echo "2. Deploying ambari(v2.4.1.0) repo file to all nodes."
echo "3. Upgrading ambari-agent, monitor, sink on all nodes."
echo "4. Restart Ambari Agent on all nodes."
echo "select :"
?
read se
?
for FQDN in `cat ~/deploy/hosts`
do
  if [ $se -eq 1 ];then
    cmd="scp -p ~/yum_repo/hdp.repo ~/yum_repo/hdp-util.repo $FQDN:/etc/yum.repos.d/"
    echo $cmd
    $cmd
    cmd="scp -p ~/yum_repo/ambari_2.2.2.repo $FQDN:/etc/yum.repos.d/ambari.repo"
    echo $cmd
    $cmd
  elif [ $se -eq 2 ];then
    cmd="scp -p ~/yum_repo/ambari_2.4.1.repo $FQDN:/etc/yum.repos.d/ambari.repo"
    echo $cmd
    $cmd
  elif [ $se -eq 3 ];then
    cmd1="ssh -tg $FQDN yum upgrade ambari-agent && echo "----------------------------------------------------------------"
    echo $cmd1
    $cmd1
    cmd2="ssh -tg $FQDN yum upgrade ambari-metrics-monitor ambari-metrics-hadoop-sink && echo "====================================="
    echo $cmd2
    $cmd2
  elif [ $se -eq 4 ];then
    cmd="ssh ?tg $FQDN ambari-agent restart"
    echo $cmd
    $cmd
  fi
done