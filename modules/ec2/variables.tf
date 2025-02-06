variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
}

variable "key_name" {
  description = "The name of the SSH key pair to associate with the instance"
  type        = string
}

variable "jenkins_repo_url" {
  description = "The URL of the GitHub repository containing the Jenkins Docker Compose file"
  type        = string
}

variable "ebs_volume_size" {
  description = "The size of the EBS volume to attach to the instance"
  type        = number
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with the instance"
  type        = list(string)
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
}