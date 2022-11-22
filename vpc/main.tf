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
resource "aws_subnet" "subnet_a" {
    vpc_id = aws_vpc.my_test_vpc.id
    cidr_block = "10.0.0.0/26"
    tags = {
      "Name" = "subnet_a"
    }
}
resource "aws_subnet" "subnet_b" {
    vpc_id = aws_vpc.my_test_vpc.id
    cidr_block = "10.0.0.64/26"
    tags = {
      "Name" = "subnet_b"
    }
}

resource "aws_subnet" "subnet_c" {
    vpc_id = aws_vpc.my_test_vpc.id
    cidr_block = "10.0.0.128/26"
    tags = {
      "Name" = "subnet_c"
    }
}

resource "aws_subnet" "subnet_d" {
    vpc_id = aws_vpc.my_test_vpc.id
    cidr_block = "10.0.0.192/26"
    tags = {
        "Name" = "subnet_d"
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
    route = []
    tags = {
        Name = "my_test_route"
    }
  
}
resource "aws_route_table_association" "a" {
    subnet_id = aws_subnet.subnet_a.id
    route_table_id = aws_route_table.my_test_route.id
  
}
resource "aws_route_table_association" "b" {
    subnet_id = aws_subnet.subnet_b.id
    route_table_id = aws_route_table.my_test_route.id
  
}

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

