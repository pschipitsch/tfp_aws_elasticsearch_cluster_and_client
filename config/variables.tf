variable "aws_region" {
  description = "The AWS region."
  type        = "string"
}

variable "domain" {
  description = "The name of the domain."
  type        = "string"
}

variable "vpc_id" {
  description = "The VPC id."
  type        = "string"
}

variable "subnet_ids" {
  description = "A comma separated list of subnet ids."
  type        = "string"
}

variable "es_instance_type" {
  description = "The instance type for Elasticsearch."
  type        = "string"
  default     = "m4.large"
}

variable "es_image_id" {
  description = "The AMI id for Elasticsearch."
  type        = "map"

  default = {
    "us-west-1" = "ami-06116566"
    "us-west-2" = "ami-9abea4fb"
  }
}

variable "key_pair_name" {
  description = "The EC2 Key Pair Name."
  type        = "string"
}

variable "route53_zone_id" {
  description = "The route53 Zone ID."
  type        = "string"
}

variable "es_record_name" {
  description = "The DNS record name for the Elasticsearch ELB."
  type        = "string"
}

variable "client_image_id" {
  description = "The AMI id for the Elasticsearch client."
  type        = "map"

  default = {
    "us-west-1" = "ami-06116566"
    "us-west-2" = "ami-9abea4fb"
  }
}

variable "client_instance_type" {
  description = "The instance type for the Elasticsearch client."
  type        = "string"
  default     = "t2.medium"
}
