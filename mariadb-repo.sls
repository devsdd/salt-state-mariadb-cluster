
yum_repo_file:
  /etc/yum.repos.d/mariadb.repo:
    file.append:
      - text: |
          [mariadb-main]
          name = MariaDB Server
          baseurl = https://downloads.mariadb.com/MariaDB/mariadb-10.4/yum/rhel/$releasever/$basearch
          gpgkey = file:///etc/pki/rpm-gpg/MariaDB-Server-GPG-KEY
          gpgcheck = 1
          enabled = 1

'yum makecache':
  cmd.run:
    - onchanges:
      - file: yum_repo_file
    - require:
      - yum_repo_file
