resource "aws_lb" "this" {
    # name = "my-test-lb"
    internal = false
    load_balancer_type = "application"
    enable_deletion_protection = false
    enable_cross_zone_load_balancing = false
    security_groups = [data.aws_security_group.security_id.id]
    access_logs {
      bucket = "reshma-cloud-practice"
      
    }

    subnets =  var.subnet_id
    # count = length(var.subnet_id)
    # subnets = var.subnet_id[count.index]
}

resource "aws_lb_target_group" "this" {
    # name = "my-test-tg"
    port = var.port
    protocol = var.protocol
    target_type = var.target
    vpc_id = var.my_vpc
    # enabled = true
      
}

resource "aws_lb_listener" "this" {
    load_balancer_arn = aws_lb.this.arn
    port = var.port
    protocol = var.protocol
    default_action {
      type = "forward"
      target_group_arn = aws_lb_listener.this.arn
    }

  
}
