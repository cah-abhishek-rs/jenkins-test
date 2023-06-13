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


# echo "Apply cloudwatch policy for the cluster" 

# terraform apply cloudwatch-policy-output


echo "Change the pwd to cloudwatch-log-group"

cd ../cloudwatch-log-group


# echo "Apply cloudwatch log group for the cluster" 

# terraform apply cloudwatch-log-group-output


echo "Change the pwd to eks-cluster-policy"

cd ../eks-cluster-policy

