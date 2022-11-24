module "test_alb" {
    # source = "sample_module/aws_lb/my_test_lb"
    source = "../"
    name = "app-lb"
    load_balancer_type = "application"
    my_vpc = var.my_vpc
    subnet_id =   [var.subnet_id]
    enable_cross_zone_load_balancing = false
    
    target_groups = [
        {

        }
    ]
}
