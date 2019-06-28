mysqldump --all-databases --force > all_databases.sql:
  cron.present:
    - identifier: MariaDBbackup
    - user: root
    - hour: '1'
    - minute: '0'
