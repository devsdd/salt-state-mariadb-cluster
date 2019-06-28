#!/bin/bash

# script must be run as root

yum makecache

rpm -q salt-minion
if [ $? -ne 0  ] ; then
  curl -L https://bootstrap.saltstack.com -o bootstrap_salt.sh
  chmod +x bootstrap_salt.sh
  ./bootstrap_salt.sh
fi

systemctl stop salt-minion.service
systemctl disable salt-minion.service
echo -e "file_client: local\n" /etc/salt/minion.d/masterless
test -d /srv/salt || mkdir /srv/{salt,pillar,formulas}

rpm -q git || yum install -y git

if [ -d "salt-state-mariadb-cluster" ] ; then
  cd salt-state-mariadb-cluster && git pull && cd -
else
  git clone https://github.com/devsdd/salt-state-mariadb-cluster.git
fi

rsync salt-state-mariadb-cluster/*.sls /srv/salt/

salt-call --local state.apply
