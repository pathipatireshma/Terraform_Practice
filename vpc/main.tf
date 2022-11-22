provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "my_test_vpc" {
    cidr_block = "10.0.0.0/24"
    instance_tenancy = "default"
    tags = {
      "Name" = "my_test_vpc"
    }
}

resource "aws_subnet" "test_subnet" {
    vpc_id = aws_vpc.my_test_vpc.id
    count = length(var.cidr_list)
    
    cidr_block = var.cidr_list[count.index]
    tags = {
      "Name" = var.subnet_list[count.index]
    }
  
}

resource "aws_internet_gateway" "my_Igway" {
    vpc_id = aws_vpc.my_test_vpc.id
    tags = {
        Name = "my_Igway"
    }
}
resource "aws_route_table" "my_test_route" {
    vpc_id = aws_vpc.my_test_vpc.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_Igway.id
    }
    tags = {
        Name = "my_test_route"
    }
  
}
resource "aws_route_table_association" "a" {
 
    count = length(aws_subnet.test_subnet[*].id)-2
    route_table_id = aws_route_table.my_test_route.id
    subnet_id = aws_subnet.test_subnet[count.index].id
  
}
# resource "aws_route_table_association" "b" {
  
#     count = length(aws_subnet.test_subnet[*].id)
#     route_table_id = aws_route_table.my_test_route.id
#     subnet_id = aws_subnet.test_subnet[count.index].id
# }

resource "aws_security_group" "my_sg_test" {
    name = "my_sg_test"
    description = "allow-all-ports"
    vpc_id = aws_vpc.my_test_vpc.id

    ingress = [
       
    {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [aws_vpc.my_test_vpc.cidr_block]
        prefix_list_ids = []
        ipv6_cidr_blocks = ["::/0"]
        security_groups = []
        self = true
    },
    {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [aws_vpc.my_test_vpc.cidr_block]
        prefix_list_ids = []
        ipv6_cidr_blocks = ["::/0"]
        security_groups = []
        self = true
    }
    ]


    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      "Name" = "my_sg_test"
    }
  
}

