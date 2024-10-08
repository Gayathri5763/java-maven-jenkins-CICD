resource "aws_instance" "ec2" {
  ami = "ami-078264b8ba71bc45e"
  key_name = "maven"
  instance_type = "t2.large"
  subnet_id = aws_subnet.pub-sub01.id
  associate_public_ip_address = true
  vpc_security_group_ids = [ aws_security_group.security-group.id ]
  iam_instance_profile = aws_iam_instance_profile.test_profile.name
  root_block_device {
    volume_size = 30
  }
  user_data = templatefile("./install_tools.sh", {})
  tags = {
    Name = "java-three-tier-project"
  }
}