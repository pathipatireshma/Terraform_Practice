data "aws_ami" "amazon" {
  most_recent = true

  filter {
    name = "name"
    value = ["amzn2-ami-kernel-5.10-hvm-2.0.20221103.3-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["137112412989"]
  
}


resource "aws_launch_configuration" "my_confg" {
    name = "my_confg"
    image_id = data.aws_ami.amazon.id
    instance_type = "t2.small"
    key_name = "Linux_key"
    user_data = "${file("test.sh")}"
    security_groups = var.sg_id

}

resource "aws_autoscaling_group" "asg_test" {
    name = "asg_test"
    max_size = 5
    min_size = 1
    desired_capacity = 1
    availability_zones = ["us-east-1a"]
    launch_configuration = aws_launch_configuration.my_confg.name
    health_check_grace_period = 300
    tag {
      key = "Name"
      value = "test_instance"
      propagate_at_launch = true
    }
}

