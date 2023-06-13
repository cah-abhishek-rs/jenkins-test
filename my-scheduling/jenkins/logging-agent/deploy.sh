#!/bin/bash  
   
echo "Logging in to EKS cluster"

aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}
aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}
aws configure set region ${AWS_REGION}
aws configure set output json
# aws eks --region ${AWS_REGION} update-kubeconfig --name digital-pharmacy-${params.environment}-cluster

echo "params.env value"

${params.environment}

echo "Change the pwd to cloudwatch-policy"

cd ../../terraform/cloudwatch-policy

echo "Initializing cloudwatch policy for the cluster"

terraform init --backend-config=backends/${params.environment}.hcl

echo "Plan cloudwatch policy for the cluster"

terraform plan -var-file=env/${params.environment}.tfvars.json -out=cloudwatch-policy-output

# echo "Apply cloudwatch policy for the cluster" 

# terraform apply cloudwatch-policy-output

echo "Built successfully"
