#!/bin/sh
dbname=laravel
user=mysql
pass=msql
COMMAND="mysql -u${user} -p${pass} "

SQL="CREATE DATABASE [IF NOT EXISTS] ${dbname}"

${COMMAND} <<_EOF_
$SQL
_EOF_