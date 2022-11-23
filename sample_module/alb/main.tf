module "applb" {
    source = "sample_module/aws_lb/my_test_lb"
    name = "app-lb"
    load_balancer_type = "application"
    vpc_id = var.my_vpc
}