resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-central-1a"  # Ersetze dies durch deine gewünschte AZ
  map_public_ip_on_launch = true  # Weist den Instanzen im Subnetz öffentliche IPs zu

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
