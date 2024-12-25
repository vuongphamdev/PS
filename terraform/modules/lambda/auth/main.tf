resource "aws_lambda_function" "register_user" {
  function_name = var.function_name
  handler       = var.handler
  runtime       = var.runtime
  role          = var.role_arn
  filename      = var.filename

  environment {
    variables = {
      COGNITO_USER_POOL_ID = var.user_pool_id
      CLIENT_ID = var.user_pool_client_id
    }
  }
}
