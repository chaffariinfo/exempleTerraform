resource "aws_vpc" "chaffari" {
  
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Chaffari"
  }
}

resource "aws_subnet" "subpub" {
  vpc_id     = aws_vpc.chaffari.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "ChaffariSub"
  }
}

resource "aws_security_group" "sg" {
  name        = "sg"
  description = "autorise SSH"
  vpc_id      = aws_vpc.chaffari.id
  ingress {
    description = "allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


/**
resource "aws_security_group" "securitygroup" {
  name        = "securitygroup"
  description = "autorisation"
  vpc_id      = aws_vpc.chaffari.id
  ingress {
    description = "Allow SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow traffic from TCP/80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
**/
