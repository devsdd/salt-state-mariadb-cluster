'/home/centos/secure_mariadb.sql':
  file.append:
     - text: |
        ALTER USER 'root'@localhost IDENTIFIED BY 'U1tr@';
        DELETE FROM mysql.user WHERE User='';
        DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
        DROP DATABASE IF EXISTS test;
        DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
        FLUSH PRIVILEGES;
     - require:
       - mariadb_packages

lockdown_mariadb:
  cmd.run:
    - name: 'mysql -sfu root < /home/centos/secure_mariadb.sql'
    - require:
      - '/home/centos/secure_mariadb.sql'
