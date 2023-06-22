#!/bin/bash

set -euo pipefail

#clone dpp-mx-shared-infrastructure-as-code repo to pipeline-tools-jenkins
echo "Cloning dpp-mx-shared-infrastructure-as-code repository" 
git clone https://github.com/cahcommercial/dpp-mx-shared-infrastructure-as-code.git pipeline-tools-jenkins

#remove this
cd pipeline-tools-jenkins
git checkout ORN-182/gateway-pipline

#Clone dpp-infrastructure-as-code repo to pipeline-tools-chart
echo "Cloning dpp-infrastructure-as-code" 
git clone https://github.com/cahcommercial/dpp-infrastructure-as-code.git pipeline-tools-chart

