# DYNAMIC ADMISSION CONTROLLERS
# MutatingAdmissionWebhook

## About

A simple Node.JS app intended to demonstrate core dynamic addmission controller concepts:
- Webhook creation
- Respond objects with base64 JSONPatch
- Webhook deployment
- Webhook registration

## Use

1. Generate certs:

```
bash certs.sh
```

2. Update `label-add-webhook-registration.yaml` `CABundle` value with base64 output of:

```
cat app/ca.crt | base64
```

3. Create own image (Docker Hub required):

```
docker build -t label-add:1.0 .
docker tag label-add:1.0 USERNAME/label-add:1.0
docker push USERNAME/label-add:1.0
```

3. Update `label-add-webhook-deploy.yaml` with your username at `image: USERNAME/label-add:1.0`.

4. Deploy:

```
kubectl apply -f label-add-webhook-deploy.yaml
kubectl apply -f label-add-webhook-registration.yaml
```

5. Test:

```
kubectl apply -f test-pod.yaml
kubectl get pods
kubectl describe pod TEST-POD-NAME
```

Notice the added labels.

## Notes

Update the `patch` file with your own information. Encode in Base64, then update `app/server.js` with new patch data. Redeploy image and pods.
