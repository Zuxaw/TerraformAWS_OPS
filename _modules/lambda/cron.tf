resource "aws_cloudwatch_event_rule" "injection" {
  name                = "injection"
  description         = "Fires every ${var.cron_rate} minutes"
  schedule_expression = "rate(${var.cron_rate} minutes)"
}

resource "aws_cloudwatch_event_target" "trigger_lamboda_on_schedule" {
  rule      = aws_cloudwatch_event_rule.injection.name
  target_id = "lambda"
  arn       = aws_lambda_function.injection.arn
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_split_lambda" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.injection.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.injection.arn
}