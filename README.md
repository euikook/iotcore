

## Generate Procedures for Private Certificates


### Generate Root CA Private Key and Certificate
```
openssl req -x509 -nodes -days 3650 -sha256 \
-newkey rsa:2048 -keyout rootca.key \
-subj "/C=KR/ST=Daejeon/L=Yuseong/O=ONEUON Inc./CN=ONEUON Certificate Autority/OU=oneuon.com" \
-out rootca.crt
```

## Generate Intermediate(Issuing) CA Key and Certificate 
openssl req -x509 -nodes -days 1825 -sha256 \ 
-newkey rsa:2048 -keyout intermca.key \
-subj "/C=KR/ST=Daejeon/L=Yuseong/O=ONEUON Inc./CN=ONEUON Intermediate Certificate Autority/OU=oneuon.com" \
-out intermca.crt



### Generate Certificate Singing Request(CSR)
```
openssl req -newkey rsa:2048 -nodes -keyout server.key \
  -subj "/C=KR/ST=Daejeon/L=Yuseong/O=ONEUON Inc./OU=DevOps/CN=*.devops.oneuon.com" \
  -out  server.csr
 ```

### Create Certificate with subjectAltName(Subject Alternative Name)
```
openssl x509 -req -days 1825 \
  -CA intermca.crt -CAkey intermca.key -CAcreateserial \
  -extfile <(printf "subjectAltName=DNS:devops.oneuon.com,DNS:www.oneuon.com") \
  -in server.csr -out server.crt
```

### Verification

```
openssl x509 -text -noout -in server.crt

```

### Generate Client Certificate
```
openssl req -newkey rsa:2048 -nodes -keyout devops.key \
  -subj "/C=KR/ST=Seoul/L=Seocho/O=ONEUON Inc./OU=DevOps/CN=devops@oneuon.com" \
  -out  devops.csr
 ```


 ```
openssl x509 -req -days 365 \
  -CA ca.crt -CAkey ca.key -CAcreateserial \
  -in devops.csr -out devops.crt
```