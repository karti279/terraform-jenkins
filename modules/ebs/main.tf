resource "aws_ebs_volume" "jenkins_data" {
  availability_zone = var.availability_zone
  size              = var.ebs_volume_size
  type              = "gp2"

  tags = {
    Name = "Jenkins-Data-Volume"
  }
}

resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/xvdf"
  volume_id   = aws_ebs_volume.jenkins_data.id
  instance_id = var.instance_id
}
