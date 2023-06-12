#!/bin/bash  
   
echo "Logging in to EKS cluster"

aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}
aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}
aws configure set region ${AWS_REGION}
aws configure set output json
# aws eks --region ${AWS_REGION} update-kubeconfig --name digital-pharmacy-${params.environment}-cluster


echo "Initializing cloudwatch policy for the cluster"

terraform init --backend-config=backends/${params.environment}.hcl --auto-approve=true

echo "Plan cloudwatch policy for the cluster"

terraform plan -var-file=env/${params.environment}.tfvars.json -out=cloudwatch-policy-output --auto-approve=false

# echo "Apply cloudwatch policy for the cluster" 

# terraform apply cloudwatch-policy-output


echo "Change the pwd to cloudwatch-log-group"

cd my-scheduling/terraform/cloudwatch-log-group

echo "Initializing cloudwatch log group for the cluster"

terraform init --backend-config=backends/${params.environment}.hcl --auto-approve=true

echo "Plan cloudwatch log group for the cluster"

terraform plan -var-file=env/${params.environment}.tfvars.json -out=cloudwatch-log-group-output --auto-approve=false

# echo "Apply cloudwatch policy for the cluster" 

# terraform apply cloudwatch-log-group-output


echo "Change the pwd to eks-cluster-policy"

cd my-scheduling/terraform/eks-cluster-policy

echo "Initializing eks cluster policy for the cluster"

terraform init --backend-config=backends/${params.environment}.hcl --auto-approve=true

echo "Plan eks cluster policy for the cluster"

terraform plan -var-file=env/${params.environment}.tfvars.json -out=eks-cluster-policy-output --auto-approve=false

# echo "Apply eks cluster policy for the cluster" 

# terraform apply eks-cluster-policy-output


#echo "Execute the helm chart to provision fluent-bit for the eks cluster"

# helm install fluent-bit-fluentd --repo git::https://github.com/cahcommercial/dpp-infrastructure-as-code.git//charts/fluent-bit?ref=main --set cluster_name="digital-pharmacy-${params.environment}-cluster"


#echo "Execute the helm chart to provision fluentd-cloudwatch for the eks cluster"

#helm install fluentd-cloudwatch --repo git::https://github.com/cahcommercial/dpp-infrastructure-as-code.git//charts/fluentd-cloudwatch?ref=main --set awsCred.accessKeyId="${AWS_ACCESS_KEY_ID}", awsCred.secretAccessKey="${AWS_SECRET_ACCESS_KEY}", clusterNames= {"digital-pharmacy-${params.environment}-cluster"}"

echo "Built successfully"
