data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t3.nano"
  subnet_id     = "subnet-09dac355a0c458a43"

  tags = {
    Name = "HelloWorld"
  }
}
