#!/bin/bash  

cd ../../charts

echo "Cloning dpp-infrastructure-as-code repository" 

git clone https://github.com/cahcommercial/dpp-infrastructure-as-code.git

git branch main

cd 'dpp-infrastructure-as-code/charts'

echo "Helm install fluent-bit" 

helm install apply-fluent-bit fluent-bit/ -f  fluent-bit/values.yaml  --values ../../fluent-bit/$ENV/values.yaml

echo "Helm install fluent-cloudwatch" 

helm install apply-fluent-bit fluentd-cloudwatch/ -f  fluentd-cloudwatch/values.yaml  --values ../../fluentd-cloudwatch/$ENV/values.yaml

echo "Helm installed successfully"
