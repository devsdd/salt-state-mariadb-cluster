lockdown_mariadb:
  cmd.run:
    - name: 'mysql --show-warnings -u root < /home/centos/salt-state-mariadb-cluster/secure_mariadb.sql'
