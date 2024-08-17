data "aws_ami" "amazon-2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
  owners = ["amazon"]
}


resource "aws_instance" "Docker-Server" {
  ami           = data.aws_ami.amazon-2.id
  instance_type = var.instance-type
  //security_groups = ["web"]
  security_groups = [aws_security_group.sg.name]
  key_name        = aws_key_pair.ec2_key.key_name
  tags = {
    Name   = "Docker server"
    Author = "Poly"
  }

  provisioner "local-exec" {
    command = "sleep 300"
  }

  user_data = file("install.sh")
}

/*
resource "aws_ebs_volume" "volume_1" {
  availability_zone = aws_instance.Server1.availability_zone
  size              = 40

  tags = {
    Name       = "Terraform volume"
    Team       = "Cloud"
    Created-by = "Terraform"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.volume_1.id
  instance_id = aws_instance.Server1.id
}
*/