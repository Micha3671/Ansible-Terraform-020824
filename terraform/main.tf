# Erstelle eine EC2-Instance
resource "aws_instance" "web" {
  ami                    = "ami-0e872aee57663ae2d" # Ubuntu Server 20.04 LTS für eu-central-1
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id # Nutzt ein öffentliches Subnetz
  vpc_security_group_ids = [aws_security_group.main_vpc_sg.id]                       # Nutzt VPC-Security-Gruppen
  key_name               = "Key2024"

  tags = {
    Name = "web-instance"
  }
}

# Output der Instance IP-Adresse
output "instance_ip" {
  value = aws_instance.web.public_ip
}
