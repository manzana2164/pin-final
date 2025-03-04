variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "The version of the EKS cluster"
  type        = string
}

variable "subnets" {
  description = "A list of subnets to place the EKS cluster in"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID to create the EKS cluster in"
  type        = string
}

variable "key_name" {
  description = "The key name to use for the EC2 instances"
  type        = string
}

variable "region" {
  description = "The AWS region to deploy the EKS cluster"
  type        = string
}

variable "node_instance_type" {
  description = "The EC2 instance type for the EKS worker nodes"
  type        = string
  default     = "t2.micro"
}

variable "desired_capacity" {
  description = "The desired number of worker nodes"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "The maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "min_size" {
  description = "The minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  description = "The CIDR blocks for the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "node_group_name" {
  description = "The name of the EKS node group"
  type        = string
  default     = "eks-node-group"
}