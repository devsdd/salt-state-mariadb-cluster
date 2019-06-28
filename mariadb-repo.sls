
mariadb-main:
  pkgrepo.managed:
    - humanname: MariaDB Server
    - baseurl: https://downloads.mariadb.com/MariaDB/mariadb-10.4/yum/rhel/$releasever/$basearch
    - gpgcheck: 1
    - gpgkey: file:///etc/pki/rpm-gpg/MariaDB-Server-GPG-KEY
