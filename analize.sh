#!/bin/bash
set -ex

LOG_DIR=/home/isucon/log
mkdir -p ${LOG_DIR}

# alp
if [ -f ${LOG_DIR}/alp.log ]; then
    sudo mv ${LOG_DIR}/alp.log ${LOG_DIR}/alp.log.$(date "+%Y%m%d_%H%M%S")
fi
sudo /usr/local/bin/alp -f /var/log/nginx/access.log --sum -r --aggregates='/api/player/competition/[a-z0-9]+/ranking$,/api/player/player/[a-z0-9]+$,/api/player/competition/[a-z0-9]+/score$,/api/organizer/competition/[a-z0-9]+/score$,/api/organizer/competition/[a-z0-9]+/finish$,/api/organizer/competition/[a-z0-9]+/score$,/api/organizer/competition/[a-z0-9]+/finish$,/api/organizer/player/[a-z0-9]+/disqualified$'

# slow query
if [ -f ${LOG_DIR}/mysql-slow.log ]; then
    sudo mv ${LOG_DIR}/mysql-slow.log ${LOG_DIR}/mysql-slow.log.$(date "+%Y%m%d_%H%M%S")
fi
sudo /usr/local/bin/pt-query-digest /var/lib/mysql/mysqld-slow.log > ${LOG_DIR}/mysql-slow.log
