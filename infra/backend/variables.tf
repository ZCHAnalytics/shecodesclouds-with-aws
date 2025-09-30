# =============================================================================
# Variables Declaration File
# Used by: main.tf and tfvars file, consumed during terraform plan/apply
# =============================================================================

variable "aws_region" {
  description = "AWS region for resource deployment"
  type        = string
}

variable "environment" {
  type = string
  description = "Deployment env"
  default = "dev"
}

variable "lambda_function_name" {
  description = "Name of the AWS Lambda function"
  type        = string
}

variable "lambda_zip_path" {
  description = "Path to the zipped Lambda deployment package"
  type        = string
}

variable "visitor_counter_table" {
  description = "Name of the DynamoDB table for visitor counts"
  type        = string
}

variable "visitors_table" {
  description = "Name of the DynamoDB table for visitor metadata"
  type        = string
}

variable "api_gateway_name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "api_route_path" {
  description = "Route path exposed by API Gateway"
  type        = string
}

variable "frontend_origin_urls" {
  description = "List of allowed frontend origins for CORS"
  type        = list(string)
}