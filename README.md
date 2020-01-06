# Nginx Proxy (Shared network)
## Used Images
- nginx -proxy
- nginx
- schickling/mailcatcher 

## Usage
**Create Docker Network**
```bbash
docker network create nginx-proxy
```
**SSL Setting**
```bash
cp .env.sample .env
```
```bash
vi .env
# example
COMPOSE_PROJECT_NAME=nginx-proxy
HOSTNAME=docer.local
CSR_ORGANIZATION=webdimension
CSR_ORGANIZATION_UNIT=webdimension
KEY_LENGYH=2048
HASH_LENGTH=sha256
EXPIRE_DAYS=36500
SAN_FILE=san.txt
OUTPUT_FILE_NAME=server
```
```bash
cp certs/san.txt.sample certs/san.txt
```
```bash
vi certs/san.txt
example
subjectAltName = @alt_names

[alt_names]
DNS.1 = *.local
DNS.2 = docker.local
...
...
many

```
**Create CSR**
```bash
cd certs
./serts.sh

# Created 
# certs/OUTPUT_FILE_NAME.key
# certs/OUTPUT_FILE_NAME.csr
# certs/OUTPUT_FILE_NAME.crt

# Add to Keychains (MAC)
```
**Start nginx-proxy**
```bash
docker-compose up -d
```
