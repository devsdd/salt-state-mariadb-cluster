mysqldump --all-databases --force > all_databases-`date +%F`.sql:
  cron.present:
    - identifier: MariaDBbackup
    - user: root
    - hour: '1'
    - minute: '0'

find /root/ -maxdepth 1 -type f -mtime +4 -name 'all_databases-*.sql' -delete:
  cron.present:
    - identifier: Delete Old Backups
    - user: root
    - hour: '0'
    - minute: '0'
