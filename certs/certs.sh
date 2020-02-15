#!/bin/bash
source  ../.env
SJ="/C=JP/ST=Tokyo/L=Shibuya-ku/O=${CSR_ORGANIZATION}/OU=${CSR_ORGANIZATION_UNIT}/CN=${HOSTNAME}"

openssl genrsa  -out ${CERTS_FILE_NAME}.key ${KEY_LENGYH}

openssl req -new -${HASH_LENGTH} -key ${CERTS_FILE_NAME}.key -out ${CERTS_FILE_NAME}.csr -subj "$SJ"

openssl x509 -req -in ${CERTS_FILE_NAME}.csr -signkey ${CERTS_FILE_NAME}.key -sha256 -days ${EXPIRE_DAYS} -out ${CERTS_FILE_NAME}.crt -extfile ${SAN_FILE}
