mysqldump --all-databases --force > all_databases.sql:
  cron.present:
    - identifier: MariaDBbackup
    - user: root
    - hour: *
    - minute: *
