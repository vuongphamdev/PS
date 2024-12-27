provider "aws" {
  region = "us-west-2"
}

module "cognito" {
  source = "./modules/cognito"
  user_pool_name = "my_user_pool"
  user_pool_client_name = "my_user_pool_client"
}

module "lambda" {
  source = "./modules/lambda/auth"
  function_name = "RegisterUserFunction"
  handler = "lambda_function.lambda_handler"
  runtime = "python3.8"
  role_arn = "arn:aws:iam::123456789012:role/lambda-execution-role"
  filename = "lambda/python/src/register/lambda_function.zip"
  user_pool_id = module.cognito.user_pool_id
  user_pool_client_id = module.cognito.user_pool_client_id
}

module "api_gateway" {
  source = "./modules/api-gateway"
  api_name = "MyAPI"
  api_description = "API for managing user registration"
  path_part = "register"
  lambda_integration_uri = module.lambda.lambda_arn
}
