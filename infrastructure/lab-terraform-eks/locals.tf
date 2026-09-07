locals {
  name = var.project_name

  common_tags = {
    Project     = var.project_name
    Environment = "lab"
    ManagedBy   = "terraform"
    Lab         = "10.12"
  }

  azs = slice(
    data.aws_availability_zones.available.names,
    0,
    2
  )
}