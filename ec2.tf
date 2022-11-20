resource "aws_instance" "my_sample_ec2" {
    instance_type = t2.micro
    vpc_id = var.vpc
  
}