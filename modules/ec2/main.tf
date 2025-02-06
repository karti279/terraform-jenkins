resource "aws_instance" "jenkins" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.security_group_ids

  user_data = <<-EOF
              #!/bin/bash
              # Debugging: Print start message
              echo "Starting user_data script..."

              # Update the system
              echo "Updating system..."
              sudo apt update -y

              # Install Docker and Git
              echo "Installing Docker and Git..."
              sudo apt install -y docker.io git

              # Install Docker Compose
              echo "Installing Docker Compose..."
              sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
              sudo chmod +x /usr/local/bin/docker-compose

              # Start and enable Docker
              echo "Starting and enabling Docker..."
              sudo systemctl start docker
              sudo systemctl enable docker

              # Clone the Jenkins Docker Compose repository
              echo "Cloning Jenkins Docker Compose repository..."
              sudo git clone ${var.jenkins_repo_url} /opt/jenkins

              # Navigate to the Jenkins directory and start the container
              echo "Starting Jenkins container..."
              cd /opt/jenkins
              sudo docker-compose up -d

              # Debugging: Print completion message
              echo "user_data script completed."
              EOF

  tags = {
    Name = "Jenkins-Instance"
  }
}

resource "aws_eip" "jenkins_eip" {
  instance = aws_instance.jenkins.id
}