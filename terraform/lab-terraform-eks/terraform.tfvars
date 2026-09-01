aws_region  = "ap-south-1"
aws_profile = "terraform-execution"

project_name = "lab-10-12-eks"

vpc_cidr = "10.0.0.0/16"

public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnet_cidrs = [
  "10.0.11.0/24",
  "10.0.12.0/24"
]

eks_cluster_version = "1.33"

node_instance_types = [
  "t3.micro"
]

node_desired_size = 1
node_min_size     = 1
node_max_size     = 1