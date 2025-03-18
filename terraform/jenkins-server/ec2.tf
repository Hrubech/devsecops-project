resource "aws_instance" "jenkins_server" {
  ami                    = data.aws_ami.ami.image_id
  instance_type          = "t2.2xlarge"
  key_name               = var.key_name
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.devsecops_security_group.id]
  iam_instance_profile   = aws_iam_instance_profile.instance_profile.name
  root_block_device {
    volume_size = 30
  }
  user_data = templatefile("./tools-install.sh", {})

  tags = {
    Name = var.instance_name
  }
}