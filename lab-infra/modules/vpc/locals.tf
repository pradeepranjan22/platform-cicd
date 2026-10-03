locals {
  name = var.project_name

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }

  azs = slice(
    data.aws_availability_zones.available.names,
    0,
    2
  )
}