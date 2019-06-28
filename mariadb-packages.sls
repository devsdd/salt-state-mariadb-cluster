mariadb_packages:
  pkg.installed:
    - pkgs:
      - MariaDB-server
      - galera-4
      - MariaDB-client
      - MariaDB-shared
      - MariaDB-backup
      - MariaDB-common
    - require:
      - yum_repo_file
