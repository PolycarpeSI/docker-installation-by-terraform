output "public_ip" {
  value = aws_instance.Docker-Server.public_ip
}

output "az" {
  value = aws_instance.Docker-Server.availability_zone
}

output "ssh-connection" {
  //value = "ssh -i ~/Downloads/devops-ec2.pem ec2-user@${aws_instance.Server1.public_ip}"
  value = "ssh -i ${var.key-name} ec2-user@${aws_instance.Docker-Server.public_ip}"
}
