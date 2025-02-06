variable "aws_region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH key name"
  default     = "my-key"
}

variable "jenkins_repo_url" {
  description = "GitHub repository URL for Docker Compose"
  default     = "https://github.com/karti279/terraform-jenkins.git"
}

variable "ebs_volume_size" {
  description = "Size of the EBS volume for Jenkins data"
  default     = 20
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-00bb6a80f01f03502" # Ubuntu
}