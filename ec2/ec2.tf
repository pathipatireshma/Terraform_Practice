resource "aws_instance" "test_instance" {
    ami = var.ami_id
    instance_type = "t2.micro"
    key_name = "Linux_key"
    vpc_security_group_ids = var.sg_id
    subnet_id = var.subnet_1
    tags = {
      "Name" = "test_instance"
    }
  
}