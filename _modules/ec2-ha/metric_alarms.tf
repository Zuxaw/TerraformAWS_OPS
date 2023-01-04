resource "aws_cloudwatch_metric_alarm" "ec2_cpu_utilization" {
  count = length(var.private_instances_ids)
  alarm_name          = "ec2-high-cpu-utilization-for-instance-${var.private_instances_ids[count.index]}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    InstanceId = "${var.private_instances_ids[count.index]}"
  }
}