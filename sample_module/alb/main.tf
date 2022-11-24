module "test_alb" {
    # source = "sample_module/aws_lb/my_test_lb"
    source = "../"
    name = "app"
    lb_type = "application"
    my_vpc = var.my_vpc
    subnet_id =   var.subnet_id
    # count = length(var.subnet_id)
    # subnets = var.subnet_id[count.index]
   
    port = var.port
    protocol = var.protocol
    target = var.target
    

        
    
}
