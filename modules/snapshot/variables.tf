variable "account_id" {
  description = "The AWS account ID"
  type        = string
  default     = "711387122585"
}

variable "region" {
  description = "The AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "volume_id" {
  description = "The ID of the EBS volume to create snapshots for"
  type        = string
}