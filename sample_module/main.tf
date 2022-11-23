resource "aws_lb" "my_test_lb" {
    name = "my-test-lb"
    internal = false
    load_balancer_type = "application"
    enable_deletion_protection = false
    security_groups = [data.aws_security_group.security_id.id]
    access_logs {
      bucket = "reshma-cloud-practice"
      
    }

    subnets = [for subnet in data.aws_subnet.subnet_name.id : var.subnet_id]
}

resource "aws_lb_target_group" "my_test_tg" {
    name = "my-test-tg"
    port = 80
    protocol = "HTTP"
    target_type = "instance"
    vpc_id = var.my_vpc
    # enabled = true
      
}

resource "aws_lb_listener" "test_listner" {
    load_balancer_arn = aws_lb.my_test_lb.arn
    port = "80"
    protocol = "HTTP"
    default_action {
      type = "forward"
      target_group_arn = aws_lb_listener.test_listner.arn
    }

  
}
