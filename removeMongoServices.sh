#!/bin/bash
cd /home/centos/script
for host in $(cat hosts.txt)
	do
		ssh  $host "echo hostname- ; hostname"
		ssh $host "sudo service mongod stop; sudo service mongos stop;  sudo yum -y erase mongodb-org*; sudo rm -rf /usr/lib/systemd/system/mongos.service /usr/lib/systemd/system/mongod.service; sudo yum remove percona* -y; sudo yum remove pmm2-client* -y ; sudo yum remove -y mongodb-org*; sudo rm -rf /etc/yum.repos.d/mongodb-org*; sudo rm /etc/mongod.conf*; sudo rm /etc/mongos.conf*; sudo rm -rf /usr/bin/pmm-agent ;sudo service mongodb-mms-backup-agent stop ;sudo rm -rf /var/lib/mongo /opt/mongodb.key /tmp/mongo-ca.pem /tmp/mongo-ca.pem /tmp/server.pem /var/log/mongo/mongod.log /etc/yum.repos.d/percona*; sudo yum clean all --verbose -y; sudo yum-complete-transaction --cleanup-only -y; sudo yum history redo last -y; sudo yum update -y; sudo rm /tmp/*.js "
	done
