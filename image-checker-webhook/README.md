# DYNAMIC ADMISSION CONTROLLERS
# ValidatingAdmissionWebhook

## About

A simple Node.JS app intended to demonstrate core dynamic addmission controller concepts:
- Webhook creation
- Request objects
- Respond objects  
- Webhook deployment
- Webhook registration

## Use

1. Generate certs:

```
bash certs.sh
```

2. Update `image-checker-webhook-registration.yaml` `CABundle` value with base64 output of:

```
cat app/ca.crt | base64
```

3. Create own image (Docker Hub required):

```
docker build -t image-checker:1.0 .
docker tag image-checker:1.0 USERNAME/image-checker:1.0
docker push USERNAME/image-checker:1.0
```

3. Update `image-checker-webhook-deploy.yaml` with your username at `image: USERNAME/image-checker:1.0`.

4. Deploy:

```
kubectl apply -f image-checker-webhook-deploy.yaml
kubectl apply -f image-checker-webhook-registration.yaml
```

5. Test:

```
kubectl apply -f test-latest.yaml
kubectl apply -f test-version.yaml
```
