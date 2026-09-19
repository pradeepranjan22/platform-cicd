terraform {
  backend "s3" {
    bucket         = "pranjan-terraform-state-156581420216"
    key            = "platform/lab-10-12/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "pranjan-terraform-state-lock"
    encrypt        = true
  }
}