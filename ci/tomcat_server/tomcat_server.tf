provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "tomcat" {
  ami = "ami-07b9c27d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.web_server.id}","${aws_security_group.allow_ssh.id}"]
  key_name = "tomcat"
  tags {
      Name = "tomcat"
  }
}

resource "aws_security_group" "allow_ssh" {
  name = "allow_all"
  description = "Allow inbound SSH traffic from any IP"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "Allow SSH"
  }
}

resource "aws_security_group" "web_server" {
  name = "web server"
  description = "Allow HTTP and HTTPS traffic in, browser access out."

  ingress {
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 1024
      to_port = 65535
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

