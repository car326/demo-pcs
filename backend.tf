terraform {
  backend "s3" {
    bucket         = "pcs-demo-demo-s3-deployments-terraform-state-infra-pipeline"
    key            = "pipeline/us-east-1-terraform_state_file"
    region         = "us-east-1"
    encrypt        = true
    kms_key_id     = "a5d1658e-1249-43af-9842-9ec8919183db"
    dynamodb_table = "pcs-demo-demo-DYNAMODB-infrastructure_management_terraform_state_lock"
  }
}