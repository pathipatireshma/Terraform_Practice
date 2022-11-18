provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "my_test_vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    tags = {
      "Name" = "my_test_vpc"
    }
}
resource "aws_subnet" "subnet_a" {
    vpc_id = aws_vpc.my_test_vpc.id
    cidr_block = "10.0.0.0/24"
  
}
output "vpc_id" {
    value = aws_vpc.my_test_vpc.id 
  
}