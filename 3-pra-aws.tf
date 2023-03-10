terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region     = var.REGION
  access_key = var.a_key
  secret_key = var.s_key
}

resource "aws_instance" "pra-ec2" {
  ami                    = "ami-00d8a762cb0c50254"
  instance_type          = "t2.micro"
  key_name               = "bastion-key"
  vpc_security_group_ids = ["sg-0b0d7fd5e94ab560c"]
  subnet_id              = "subnet-09adce2c7abad84c3"
  count = 1
  user_data = file("./4-jump-item-create.sh")
  tags = {
    Name = "PRA Jump Item"
  }
}
