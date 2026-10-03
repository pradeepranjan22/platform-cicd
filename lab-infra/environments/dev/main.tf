module "vpc" {
  source = "../../modules/vpc"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "iam" {
  source = "../../modules/iam"

  project_name = var.project_name
  environment  = var.environment
}

module "eks" {
  source = "../../modules/eks"

  cluster_name       = var.cluster_name
  cluster_version    = var.eks_cluster_version
  private_subnet_ids = module.vpc.private_subnet_ids

  cluster_role_arn = module.iam.eks_cluster_role_arn
  node_role_arn    = module.iam.eks_node_role_arn

  node_instance_types = var.node_instance_types
  node_desired_size   = var.node_desired_size
  node_min_size       = var.node_min_size
  node_max_size       = var.node_max_size

  kube_proxy_version = var.kube_proxy_version
  ebs_csi_role_arn   = module.iam.ebs_csi_role_arn

  depends_on = [
    module.iam
  ]
}

/*module "kubernetes_platform" {
  source = "../../modules/kubernetes-platform"

  environment            = var.environment
  dockerhub_username     = var.dockerhub_username
  dockerhub_access_token = var.dockerhub_access_token

  depends_on = [
    module.eks
  ]
}*/