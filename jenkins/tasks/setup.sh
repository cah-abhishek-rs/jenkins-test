#!/bin/bash

set -euo pipefail

echo "${SERVICE_IMAGE} --service image"

echo "Cloning dpp-mx-shared-infrastructure-as-code repository" 
git clone https://github.com/cahcommercial/dpp-mx-shared-infrastructure-as-code.git pipeline-tools-jenkins

cd pipeline-tools-jenkins
git checkout ORN-182/gateway-pipline

echo "Cloning dpp-infrastructure-as-code" 
git clone https://github.com/cahcommercial/dpp-infrastructure-as-code.git pipeline-tools-chart

cd pipeline-tools-chart
git checkout main

cd ..
pwd