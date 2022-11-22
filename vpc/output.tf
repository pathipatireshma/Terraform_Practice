output "vpc_id" {
    value =  aws_vpc.my_test_vpc.id
}
output "aws_internet_gateway" {
    value = aws_internet_gateway.my_Igway.id
}

output "aws_security_group" {
    value = aws_security_group.my_sg_test
  
}