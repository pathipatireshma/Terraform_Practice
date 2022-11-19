variable "vpc" {
    vpc_id = aws_vpc.my_test_vpc.id
  
}
variable "subnet_1" {
    subnet_id = aws_subnet.subnet_a.id
  
}
variable "subnet_2" {
    subnet_id = aws_subnet.subnet_b.id
  
}