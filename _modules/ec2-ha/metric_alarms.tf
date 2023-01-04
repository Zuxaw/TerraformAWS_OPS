resource "aws_cloudwatch_metric_alarm" "ec2_cpu_utilization" {
  count = length(aws_instance.webserver)
  alarm_name          = "ec2-high-cpu-utilization-for-instance-${aws_instance.webserver[count.index].id}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    InstanceId = "${aws_instance.webserver[count.index].id}"
  }
}