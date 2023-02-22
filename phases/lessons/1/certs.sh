# Certificate authority key and certificate
openssl req -new -x509 -nodes -subj '/CN=Image Validation Webhook' -keyout ca.key -out ca.crt 

# Server key
openssl genrsa -out server.key 2048

# Certificate signing request
openssl req -new -key server.key -subj '/CN=image-checker.default.svc' -out server.csr

# Server certificate
openssl x509 -req -extfile <(printf "subjectAltName=DNS:image-checker.default.svc") -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt 

# Copy certs to app folder
chmod 644 *.key
cp ca.crt ./app
cp server.crt ./app
cp server.key ./app

# Cleanup
rm ca.crt
rm server.crt
rm server.key
rm ca.key
rm ca.srl
rm server.csr
