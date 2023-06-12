terraform {
  required_providers {
    aws = "~> 4.22.0"
  }
  backend "s3" {}
}

provider "aws" {}

module "dpp-myscheduling-cloudwatch-log-group" {
  source            = "git::https://github.com/cahcommercial/dpp-infrastructure-as-code.git//terraform/cloudwatch-log-group?ref=main"
  name              = var.log_group_name
  retention_in_days = var.retention_in_days
  tags              = var.tags
}
