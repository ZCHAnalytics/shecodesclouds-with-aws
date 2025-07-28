# =============================================================================
# Outputs: DynamoDB & AWS Lambda Infrastructure
# Used by: GitHub Actions post-apply stage (output summary, downstream steps)
# =============================================================================

# -----------------------------------------------------------------------------
# Database Outputs
# -----------------------------------------------------------------------------

output "dynamodb_visitor_counter_table" {
  value       = aws_dynamodb_table.visitor_counter.name
  description = "Name of the DynamoDB table for visitor counts"
  # Used by: Lambda environment variables and GitHub summary
}

output "dynamodb_visitors_table" {
  value       = aws_dynamodb_table.visitors.name
  description = "Name of the DynamoDB table for visitor metadata"
  # Used by: Lambda environment variables
}

# -----------------------------------------------------------------------------
# API Outputs
# -----------------------------------------------------------------------------

output "lambda_function_name" {
  value       = aws_lambda_function.resume_function.function_name
  description = "Name of the deployed Lambda function"
  # Informational
}

output "lambda_function_arn" {
  value       = aws_lambda_function.resume_function.arn
  description = "ARN of the Lambda function"
  # Useful for IAM policies or integrations
}

output "api_gateway_url" {
  value       = aws_apigatewayv2_api.resume_api.api_endpoint
  description = "Public URL of the API Gateway endpoint"
  # Used by: GitHub summary output and frontend integration
}

output "api_endpoint" {
  value       = "${aws_apigatewayv2_api.resume_api.api_endpoint}/visit"
  description = "Fully qualified API endpoint for the VisitorCounter function"
  # Useful for integration testing or frontend config
}

# -----------------------------------------------------------------------------
# Diagnostics Outputs
# -----------------------------------------------------------------------------

output "cloudwatch_log_group" {
  value       = aws_cloudwatch_log_group.lambda_logs.name
  description = "CloudWatch log group for Lambda diagnostics"
  # Used by: Monitoring and debugging
}