#!/bin/bash  
   
echo "Logging in to EKS cluster"

aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}
aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}
aws configure set region ${AWS_REGION}
aws configure set output json
# aws eks --region ${AWS_REGION} update-kubeconfig --name digital-pharmacy-${params.environment}-cluster

echo "params.env value"

echo $ENV

echo "Change the pwd to cloudwatch-policy"

cd ../../terraform/cloudwatch-policy

echo "Initializing cloudwatch policy for the cluster"

terraform init --backend-config=backends/$ENV.hcl

echo "Plan cloudwatch policy for the cluster"

terraform plan -var-file=env/$ENV.tfvars.json -out=cloudwatch-policy-output

# echo "Apply cloudwatch policy for the cluster" 

# terraform apply cloudwatch-policy-output


echo "Change the pwd to cloudwatch-log-group"

cd ../cloudwatch-log-group

echo "Initializing cloudwatch log group for the cluster"

terraform init --backend-config=backends/$ENV.hcl

echo "Plan cloudwatch policy for the cluster"

terraform plan -var-file=env/$ENV.tfvars.json -out=cloudwatch-log-group-output

# echo "Apply cloudwatch log group for the cluster" 

# terraform apply cloudwatch-log-group-output


echo "Change the pwd to eks-cluster-policy"

cd ../eks-cluster-policy

echo "Initializing eks cluster policy for the cluster"

terraform init --backend-config=backends/$ENV.hcl

echo "Plan eks cluster policy for the cluster"

terraform plan -var-file=env/$ENV.tfvars.json -out=eks-cluster-policy-output

# echo "Apply eks cluster policy for the cluster" 

# terraform apply eks-cluster-policy-output

echo "Terraform applied successfully"

pwd

cd ../charts/

# echo "Cloning dpp-infrastructure-as-code repository" 

git(
    url: 'https://github.com/cahcommercial/dpp-infrastructure-as-code.git',
    branch: "main"
)

cd 'dpp-infrastructure-as-code/charts'

pwd

# echo "Helm install fluent-bit" 

helm install apply-fluent-bit fluent-bit/ --values ../../fluent-bit/$ENV/values.yaml --dry-run --debug

# echo "Helm install fluent-cloudwatch" 

helm install apply-fluentd-cloudwatch fluentd-cloudwatch/ --values ../../fluentd-cloudwatch/$ENV/values.yaml --dry-run --debug

echo "Helm installed successfully"

