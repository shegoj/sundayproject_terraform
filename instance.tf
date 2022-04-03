resource "aws_instance" "webserver" {
  ami           = "ami-080af029940804103"
  instance_type = "t2.micro"
  count         = 1
  key_name      = "techleat2022"

  tags = {
    Name = "web server"
  }
}

resource "aws_instance" "appserver" {
  ami           = "ami-080af029940804103"
  instance_type = "t2.micro"
  count         = 1
  key_name      = "techleat2022"

  tags = {
    Name = "app server"
  }
}