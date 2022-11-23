data "aws_ami" "amazon" {
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20221103.3-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["137112412989"]
  
}


data "aws_security_group" "security_id" {
    filter {
      name = "vpc-id"
      values = [var.my_vpc]
    }
    filter {
      name = "group-name"
      values = ["my_sg_test"]
    }
  
}

data "aws_subnet" "subnet_name" {
    filter {
      name = "vpc-id"
      values = [var.my_vpc]
    }
    filter {
      name = "subnet-id"
      values = ["subnet-07ec79d828981a1f8"]
    }

  
}
