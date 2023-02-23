# Deploy an EKS Cluster and Workstation on an AWS Cloud Sandbox

## Create Cluster

1. Connect to the Sandbox environment.

2. Spin up Amazon Linux 2 AMI on EC2, log in to instance, and prepare by first updating the AWS CLI: 

```
aws --version
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/bin --install-dir /usr/bin/aws-cli --update
aws --version
```

3. Configure to work with the provided access and secret keys. Set region to `us-east-1`. Desired output format can be `json` or `yaml`:

```
aws configure
```

4. Set up `kubectl`:

```
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.24.10/2023-01-30/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv kubectl /usr/bin/
kubectl version 
```

5. Set up `eksctl`:

```
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/bin
eksctl version
```

6. Create cluster:

```
eksctl create cluster --name dev --region us-east-1 --nodegroup-name standard-workers --node-type t3.medium --nodes 1 --nodes-min 1 --nodes-max 2 --managed
```

7. Connect:

```
eksctl get cluster
aws eks update-kubeconfig --name dev --region us-east-1
```

8. Cleanup (remove files):

```
rm -rf aws
rm awscliv2.zip
```

## Delete Cluster

```
eks delete cluster dev
```
