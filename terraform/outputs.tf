output "user_pool_id" {
  value = module.cognito.user_pool_id
}

output "user_pool_client_id" {
  value = module.cognito.user_pool_client_id
}

output "lambda_arn" {
  value = module.lambda.lambda_arn
}

output "api_url" {
  value = module.api_gateway.api_url
}
