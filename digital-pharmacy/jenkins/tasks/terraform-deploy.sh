#!/bin/bash  

echo "Copy terraform.tf file into policy specific folder"
cp ../../terraform/terraform.tf ../../terraform/cloudwatch-log-group/
cp ../../terraform/terraform.tf ../../terraform/cloudwatch-policy/
cp ../../terraform/terraform.tf ../../terraform/eks-cluster-policy/

echo "Change the pwd to cloudwatch-policy"
cd ../../terraform/cloudwatch-policy
echo "Initializing cloudwatch policy for the cluster"
terraform init --backend-config=backends/$ENV.hcl
echo "Plan cloudwatch policy for the cluster"
terraform plan -var-file=env/$ENV.tfvars.json -out=cloudwatch-policy-output

echo "Condition check for cloudwatch policy dry run"
if [ $TEST = false ]
then
    echo "Apply cloudwatch policy for the cluster" 
    terraform apply cloudwatch-policy-output
fi

echo "Change the pwd to cloudwatch-log-group"
cd ../cloudwatch-log-group
echo "Initializing cloudwatch log group for the cluster"
terraform init --backend-config=backends/$ENV.hcl
echo "Plan cloudwatch log group for the cluster"
terraform plan -var-file=env/$ENV.tfvars.json -out=cloudwatch-log-group-output

echo "Condition check for cloudwatch log group dry run"
if [ $TEST = false ]
then
    echo "Apply cloudwatch log group for the cluster" 
    terraform apply cloudwatch-log-group-output
fi

echo "Change the pwd to eks-cluster-policy"
cd ../eks-cluster-policy
echo "Initializing eks cluster policy for the cluster"
terraform init --backend-config=backends/$ENV.hcl
echo "Plan eks cluster policy for the cluster"
terraform plan -var-file=env/$ENV.tfvars.json -out=eks-cluster-policy-output

echo "Condition check for eks cluster policy dry run"
if [ $TEST = false ]
then
    echo "Apply eks cluster policy for the cluster" 
    terraform apply eks-cluster-policy-output
fi

echo "Terraform scripts executed successfully"
