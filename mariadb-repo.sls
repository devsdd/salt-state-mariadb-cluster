
mariadb-main:
  pkgrepo.managed:
    - humanname: MariaDB Server
    - baseurl: https://downloads.mariadb.com/MariaDB/mariadb-10.4/yum/rhel/$releasever/$basearch
    - gpgcheck: 0
