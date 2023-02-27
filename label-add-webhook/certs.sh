# Certificate authority key and certificate
openssl req -new -x509 -nodes -subj '/CN=Label Add Webhook' -keyout ca.key -out ca.crt 

# Server key
openssl genrsa -out server.key 2048

# Certificate signing request
openssl req -new -key server.key -subj '/CN=label-add.default.svc' -out server.csr

# Server certificate
openssl x509 -req -extfile <(printf "subjectAltName=DNS:label-add.default.svc") -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt 

# Copy certs to app folder
chmod 644 *.key
cp ca.crt ./app
cp server.crt ./app
cp server.key ./app
cp ca.key ./app
cp ca.srl ./app
cp server.csr ./app

# Cleanup
rm ca.crt
rm server.crt
rm server.key
rm ca.key
rm ca.srl
rm server.csr
