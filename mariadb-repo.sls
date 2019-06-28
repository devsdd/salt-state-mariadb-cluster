
yum_repo_file:
  '/etc/yum.repos.d/mariadb.repo':
    - pkgrepo.managed:
      - name: mariadb-main
      - humanname: MariaDB Server
      - baseurl: https://downloads.mariadb.com/MariaDB/mariadb-10.4/yum/rhel/$releasever/$basearch
      - gpgcheck: 1
      - gpgkey: file:///etc/pki/rpm-gpg/MariaDB-Server-GPG-KEY

'yum makecache':
  cmd.run:
    - onchanges:
      - file: yum_repo_file
    - require:
      - yum_repo_file
