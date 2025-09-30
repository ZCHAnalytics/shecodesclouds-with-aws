# ----- Terraform Settings -----
terraform {
  required_version = ">= 1.0" # Ensure Terraform CLI is v1.0 or newer
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  } 

  backend "s3" {
    bucket  = "zch-tfstate-bucket"      
    key     = "terraform.tfstate"
    region  =  "eu-west-2"
    use_lockfile = true 
    encrypt = true 
    profile = "cli-dev"
  }
}
provider "aws" {
  region = var.aws_region
}

resource "aws_lambda_function" "resume_function" {
  function_name = "${var.lambda_function_name}-${var.environment}"
  filename      = var.lambda_zip_path
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.10"
  role          = aws_iam_role.lambda_exec.arn

  source_code_hash = filebase64sha256(var.lambda_zip_path)

  environment {
    variables = {
      ENVIRONMENT = var.environment
    }
  }
}

resource "aws_dynamodb_table" "visitor_counter" {
  name         = "${var.visitor_counter_table}-${var.environment}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "visitors" {
  name         = "${var.visitors_table}-${var.environment}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "visitor_id"

  attribute {
    name = "visitor_id"
    type = "S"
  }
}

resource "aws_api_gateway_rest_api" "resume_api" {
  name        = "${var.api_gateway_name}-${var.environment}"
  description = "Resume API Gateway"
}
