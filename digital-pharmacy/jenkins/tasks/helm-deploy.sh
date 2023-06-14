#!/bin/bash  

echo "Change the pwd to digital-pharmacy/charts "
cd ../../charts
echo "Cloning dpp-infrastructure-as-code repository" 
git clone https://github.com/cahcommercial/dpp-infrastructure-as-code.git
git branch main
cd 'dpp-infrastructure-as-code/charts'

echo "Condition check for fluent-bit dry run"
if [ $TEST = true ]
then
    echo "Helm install fluent-bit --dry-run" 
    helm install apply-fluent-bit fluent-bit/ -f  fluent-bit/values.yaml  --values ../../fluent-bit/$ENV/values.yaml --dry-run
else
    echo "Helm install fluent-bit"
    helm install apply-fluent-bit fluent-bit/ -f  fluent-bit/values.yaml  --values ../../fluent-bit/$ENV/values.yaml
fi

echo "Condition check for fluentd-cloudwatch dry run"
if [ $TEST = true ]
then
    echo "Helm install fluentd-cloudwatch --dry-run" 
    helm install apply-fluentd-cloudwatch fluentd-cloudwatch/ -f  fluentd-cloudwatch/values.yaml  --values ../../fluentd-cloudwatch/$ENV/values.yaml --dry-run
else
    echo "Helm install fluentd-cloudwatch" 
    helm install apply-fluentd-cloudwatch fluentd-cloudwatch/ -f  fluentd-cloudwatch/values.yaml  --values ../../fluentd-cloudwatch/$ENV/values.yaml
fi

echo "Helm chart installed successfully"
