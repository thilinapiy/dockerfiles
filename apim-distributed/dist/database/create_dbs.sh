#!/bin/bash -x

while true 
do 
    echo '1' >/dev/tcp/$MYSQL_PORT_3306_TCP_ADDR/$MYSQL_PORT_3306_TCP_PORT 2>/dev/null ;
    if [ "$?" -eq 0 ] ; then
        break;
    fi
    sleep 1
done

MYSQL_CMD="mysql -h$MYSQL_PORT_3306_TCP_ADDR -P$MYSQL_PORT_3306_TCP_PORT -uroot -p$MYSQL_ENV_MYSQL_ROOT_PASSWORD"

$MYSQL_CMD '-e create database dbApimConfig'
$MYSQL_CMD '-e create database dbUserstore'
$MYSQL_CMD '-e create database dbGovernance'
$MYSQL_CMD '-e create database dbApiMgt'
$MYSQL_CMD '-e create database dbApiStatus'

$MYSQL_CMD '-e grant all on dbApimConfig.* TO ConfigDBUser@"%" identified by "ConfigDBUserPass"'
$MYSQL_CMD '-e grant all on dbUserstore.* TO UserstoreUser@"%" identified by "UserstoreUserPass"'
$MYSQL_CMD '-e grant all on dbGovernance.* TO GovernanceUser@"%" identified by "GovernanceUserPass"'
$MYSQL_CMD '-e grant all on dbApiMgt.* TO ApiMgtUser@"%" identified by "ApiMgtUserPass"'
$MYSQL_CMD '-e grant all on dbApiStatus.* TO ApiStatuUser@"%" identified by "ApiStatuUserPass"'

$MYSQL_CMD dbApimConfig < /mysql/mysql.sql
$MYSQL_CMD dbUserstore < /mysql/mysql.sql
$MYSQL_CMD dbGovernance < /mysql/mysql.sql
$MYSQL_CMD dbApiStatus < /mysql/mysql.sql
$MYSQL_CMD dbApiMgt < /mysql/apimgt.sql
