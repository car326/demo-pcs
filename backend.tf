terraform {
  backend "s3" {
    bucket         = "491085392714-terraforms-state-bucket20241007230952788600000001"
    key            = "pipeline/us-east-1-terraform_state_file"
    region         = "us-east-1"
    dynamodb_table = "infrastructure_management_terraform_state_lock"
  }
}