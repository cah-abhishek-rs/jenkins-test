terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {}
}

provider "aws" {
  region = "us-east-1"
}

module "eks_cluster" {
  source                      = "git@github.com:cahcommercial/dpp-mx-shared-infrastructure-as-code.git//modules/terraform/eks-cluster?ref=main"
  aws_region                  = var.aws_region
  context                     = var.context
  aws_subnets                 = var.aws_subnets
  ec2_key_pairs               = var.ec2_key_pairs
  mx_management_sg_ids        = var.mx_management_sg_ids
  security_group_ids          = var.security_group_ids
  cluster_name                = var.cluster_name
  eks_version                 = var.eks_version
  eks_ami_namespace           = var.eks_ami_namespace
  aws_account_id              = var.aws_account_id
  aws_vpc_id                  = var.aws_vpc_id
  domain                      = var.domain
  instance_type               = var.instance_type
  volume_size                 = var.volume_size
  volume_type                 = var.volume_type
  device_name                 = var.device_name
  apm_id                      = var.apm_id
  cost_center                 = var.cost_center
  maintained_by               = var.maintained_by
  product_team                = var.product_team
  eks_node_group_desired_size = var.eks_node_group_desired_size
  eks_node_group_max_size     = var.eks_node_group_max_size
  eks_node_group_min_size     = var.eks_node_group_min_size
  additional_tags             = var.additional_tags
}

