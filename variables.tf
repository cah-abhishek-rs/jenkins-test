variable "aws_region" {
  type        = string
  description = "The aws region code where this stack will be deployed"
}

variable "context" {
  type        = string
  description = "The deployment context to use e.g. dev/uat/perf/prod"
}

variable "aws_subnets" {
  type        = list(any)
  description = "The subnet ids that the stack will use"
}

variable "ec2_key_pairs" {
  type        = string
  description = "The ec2 key pairs to use for eks node cluster."
}

variable "mx_management_sg_ids" {
  type        = list(any)
  description = "Remote access security group mxUAT/mxProd-Management."
}

variable "security_group_ids" {
  type        = list(any)
  description = "EKS created security group."
}

variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster to create"
}

variable "eks_version" {
  type        = string
  description = "The kubernetes version"
}

variable "eks_ami_namespace" {
  type        = string
  description = "The kubernetes version"
}

variable "aws_account_id" {
  type        = string
  description = "AWS account id"
}

variable "aws_vpc_id" {
  type        = string
  description = "AWS vpc id"
}

variable "domain" {
  type        = string
  description = "Domain name"
}


variable "instance_type" {
  type        = string
  description = "Instance type"
}

variable "volume_size" {
  type        = number
  description = "Volume size"
}

variable "volume_type" {
  type        = string
  description = "Volume type"
}

variable "device_name" {
  type        = string
  description = "Device name"
}

variable "additional_tags" {
  default     = {}
  type        = map(string)
  description = "Additional Cluster resource tags"
}

variable "apm_id" {
  type        = string
  description = "Apm Id"
}

variable "cost_center" {
  type        = string
  description = "Cost Center"
}


variable "maintained_by" {
  type        = string
  description = "Maintained By"
}

variable "product_team" {
  type        = string
  description = "Product Team"
}

variable "eks_node_group_desired_size" {
  type        = number
  description = "EKS node group desired size"
}


variable "eks_node_group_max_size" {
  type        = number
  description = "EKS node group max size"
}


variable "eks_node_group_min_size" {
  type        = number
  description = "EKS node group min size"
}

