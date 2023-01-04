data "aws_iam_role" "cloudwatch" {
    name = "robomaker_students"
}

resource "aws_lambda_function" "injection" {
  filename      = "${path.module}/src/lambda_functions.zip"
  function_name = "injection_${var.cfg.env}"
  role          = data.aws_iam_role.cloudwatch.arn
  handler       = "lambda_function_injection.lambda_handler"
  source_code_hash = filebase64sha256("${path.module}/src/lambda_functions.zip")

  runtime = "python3.9"

  environment {
    variables = {
      PUBLIC_IP = var.url
    }
  }
}