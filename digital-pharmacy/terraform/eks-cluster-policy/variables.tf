variable "aws_account_id" {
  type        = string
  description = "AWS Account ID"
}

variable "region" {
  type        = string
  description = "AWS Region to deploy the resource"
  default     = "us-east-1"
}

variable "user_name" {
  type        = string
  description = "AWS IAM user name"
}

variable "eks_cluster_policy_name" {
  type        = string
  description = "Policy name for the EKS Cluster Policy"
}

variable "eks_cluster_name" {
  type        = string
  description = "Name of the cluster to attach the policy"
}
