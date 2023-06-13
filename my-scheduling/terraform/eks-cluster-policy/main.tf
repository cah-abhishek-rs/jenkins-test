terraform {
  required_providers {
    aws = "~> 4.22.0"
  }
  backend "s3" {}
}

provider "aws" {}

module "dpp-myscheduling-eks-cluster-policy" {
  source                  = "git::https://github.com/cahcommercial/dpp-infrastructure-as-code.git//terraform/eks-cluster-policy?ref=main"
  eks_cluster_policy_name = var.eks_cluster_policy_name
  user_name               = var.user_name
  aws_account_id          = var.aws_account_id
  eks_cluster_name        = var.eks_cluster_name
}