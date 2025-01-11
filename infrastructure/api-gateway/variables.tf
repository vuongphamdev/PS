variable "api_name" {
  description = "The name of the API Gateway REST API"
  type        = string
}

variable "api_description" {
  description = "The description of the API Gateway REST API"
  type        = string
}

variable "path_part" {
  description = "The path part of the API Gateway resource"
  type        = string
}

variable "lambda_integration_uri" {
  description = "The URI of the Lambda function to integrate with the API Gateway"
  type = string
}
