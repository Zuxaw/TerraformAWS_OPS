resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "my-dashboard"
  
  dashboard_body = <<EOF
    {
    "widgets": [
        {
            "type": "metric",
            "x": 0,
            "y": 0,
            "width": 12,
            "height": 6,
            "properties": {
                "metrics": [
                    ${join(
                        ",\n",
                        [for id in aws_instance.webserver[*].id : "[\"AWS/EC2\", \"CPUUtilization\", \"InstanceId\", \"${id}\"]"]
                    )}
                ],
                "period": 300,
                "stat": "Average",
                "region": "us-east-1",
                "title": "EC2 Instance CPU"
            }
        }
    ]}
    EOF
}