output "confg_name" {
    value = aws_launch_configuration.my_confg.name
  
}

output "asg_name" {
    value = aws_autoscaling_group.asg_test.name
  
}