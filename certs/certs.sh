#!/bin/bash
 if [ $# -ne 1 ]; then
   echo "usage: $0 <fqdn>"
    exit 1;
 fi
#. ../htdocs/.env
CN=$1
# 対話式で入力するdistinguished nameを一度に指定。コモンネームは第1引数
SJ="/C=JP/ST=Tokyo/L=Shibuya-ku/O=webdimension/OU=webdimension/CN=$CN"

# 秘密鍵を作成
openssl genrsa  -out server.key 2048

# CSR出力
openssl req -new -sha256 -key server.key -out server.csr -subj "$SJ"

# 確認のためにCSR内容を表示
# openssl req -noout -text -in ssl/server.csr

# CRT作成
# openssl x509 -req -in ssl/server.csr -signkey ssl/server.key -sha256 -days 36500 -out ssl/server.crt
FILE="san.txt"
#if [ -e ${FILE} ]; then
# rm  ${FILE}
#fi
#touch ${FILE}
#echo "subjectAltName = DNS:$CN" >> ${FILE}
openssl x509 -req -in server.csr -signkey server.key -sha256 -days 36500 -out server.crt -extfile ${FILE}
