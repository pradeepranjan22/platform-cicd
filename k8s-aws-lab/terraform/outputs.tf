output "nodes" {
  value = {
    for name, instance in aws_instance.k8s :
    name => {
      private_ip = instance.private_ip
      public_ip  = instance.public_ip
      role       = instance.tags.Role
    }
  }
}
output "kubernetes_api_dns" {
  value = aws_route53_record.k8s_api.fqdn
}
output "k8s_node_iam_role_name" {
  description = "IAM role attached to Kubernetes EC2 nodes"
  value       = aws_iam_role.k8s_nodes.name
}

output "k8s_node_instance_profile" {
  description = "IAM instance profile attached to Kubernetes EC2 nodes"
  value       = aws_iam_instance_profile.k8s_nodes.name
}

output "ebs_csi_policy_arn" {
  description = "AWS managed policy used by EBS CSI"
  value       = data.aws_iam_policy.ebs_csi_driver.arn
}