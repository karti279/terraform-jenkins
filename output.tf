output "instance_public_ip" {
  description = "The public IP address of the Jenkins instance"
  value       = module.ec2.public_ip
}

output "volume_id" {
  description = "The ID of the EBS volume"
  value       = module.ebs.volume_id
}