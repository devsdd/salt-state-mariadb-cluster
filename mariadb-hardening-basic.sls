secure_mariadb_sql_file:
  file.managed:
     - name: /home/centos/secure_mariadb.sql
     - source: https://raw.githubusercontent.com/devsdd/salt-state-mariadb-cluster/master/secure_mariadb.sql
     - skip_verify: True
     - require:
       - mariadb_packages

lockdown_mariadb:
  cmd.run:
    - name: 'mysql --show-warnings -u root < /home/centos/secure_mariadb.sql'
    - require:
      - secure_mariadb_sql_file
