output "public_ip" {
  description = "The public IP address of the Jenkins instance"
  value       = aws_eip.jenkins_eip.public_ip
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.jenkins.id
}

output "availability_zone" {
  description = "The availability zone of the EC2 instance"
  value       = aws_instance.jenkins.availability_zone
}