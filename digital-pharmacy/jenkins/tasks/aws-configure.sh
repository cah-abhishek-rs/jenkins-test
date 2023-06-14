#!/bin/bash  

echo "Logging in to EKS cluster"
aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}
aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}
aws configure set region ${AWS_REGION}
aws configure set output json

echo "Generating kubeconfig"
aws eks --region ${AWS_REGION} update-kubeconfig --name digital-pharmacy-$ENV-cluster

echo "Logged in successfully"
