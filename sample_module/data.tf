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
      values = var.subnet_id
    }

  
}

data "aws_s3_bucket" "selected" {
    bucket = "reshma-cloud-practice"
  
}