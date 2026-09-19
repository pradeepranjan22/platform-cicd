terraform {
  backend "s3" {
    bucket       = "pranjan-terraform-state-156581420216"
    key          = "platform/lab-10-12/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
    encrypt      = true
  }
}