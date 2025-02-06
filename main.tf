provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}

module "ec2" {
  source = "./modules/ec2"

  instance_type      = var.instance_type
  key_name           = var.key_name
  jenkins_repo_url   = var.jenkins_repo_url
  ebs_volume_size    = var.ebs_volume_size
  security_group_ids = [aws_security_group.jenkins_sg.id]
  ami_id             = var.ami_id
}

module "ebs" {
  source = "./modules/ebs"

  availability_zone = module.ec2.availability_zone
  instance_id       = module.ec2.instance_id
  ebs_volume_size   = var.ebs_volume_size
}

module "snapshot" {
  source = "./modules/snapshot"

  volume_id = module.ebs.volume_id
  account_id = data.aws_caller_identity.current.account_id
  region     = var.aws_region
}

resource "aws_security_group" "jenkins_sg" {
  name_prefix = "jenkins-sg-"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}