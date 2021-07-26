provider "aws" {
  region = var.region
}
resource "aws_instance" "my-instance" {
  ami           = "ami-0dc2d3e4c0f9ebd18"
  subnet_id     = aws_subnet.subpub.id
  instance_type = "t3.micro"
  vpc_security_group_ids      = [aws_security_group.sg.id]
}




