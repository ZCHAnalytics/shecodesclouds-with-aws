# terraform.tfvars
# -------------------------------------------------------------------
# Used during both `terraform plan` and `terraform apply` steps.
# Holds non-sensitive values for variable substitution.
# Do NOT put secrets here — use GitHub Secrets or AWS Secrets Manager.
# -------------------------------------------------------------------

aws_region               = "eu-west-2"                       # AWS region (London)

lambda_function_name     = "zch-resume-function"             # Must be globally unique within AWS Lambda
lambda_zip_path          = "./function.zip"                  # Path to zipped Lambda code

visitor_counter_table    = "VisitorCounter"                  # DynamoDB table for visit counts
visitors_table           = "Visitors"                        # DynamoDB table for visitor metadata

api_gateway_name         = "resume-api"                      # API Gateway name
api_route_path           = "/visit"                          # Route exposed by API Gateway

frontend_origin_urls     = ["https://amazoncodesclouds.azureedge.net"]    # CORS whitelist for API Gateway (if configured)