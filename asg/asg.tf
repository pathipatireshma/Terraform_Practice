resource "aws_launch_configuration" "my_confg" {
    name = "my_confg"
    image_id = data.aws_ami.amazon.id
    instance_type = "t2.small"
    key_name = "Linux_key"
    user_data = "${file("test.sh")}"
    security_groups = [data.aws_security_group.security_id.id]

}

resource "aws_autoscaling_group" "asg_test" {
    name = "asg_test"
    max_size = 5
    min_size = 1
    desired_capacity = 1
    # availability_zones = ["us-east-1c"]
    vpc_zone_identifier = [data.aws_subnet.subnet_name.id]
    launch_configuration = aws_launch_configuration.my_confg.name
    health_check_grace_period = 300
    tag {
      key = "Name"
      value = "test_instance"
      propagate_at_launch = true
    }
}

