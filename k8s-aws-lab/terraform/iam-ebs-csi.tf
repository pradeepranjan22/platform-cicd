#
# Kubernetes node IAM role
#

resource "aws_iam_role" "k8s_nodes" {
  name = "k8s-nodes-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name        = "k8s-nodes-role"
    Environment = "lab"
    Component   = "kubernetes"
  }
}

#
# EBS CSI IAM policy
#

data "aws_iam_policy" "ebs_csi_driver" {
  arn = "arn:aws:iam::aws:policy/AmazonEBSCSIDriverPolicyV2"
}

resource "aws_iam_role_policy_attachment" "ebs_csi_driver" {
  role       = aws_iam_role.k8s_nodes.name
  policy_arn = data.aws_iam_policy.ebs_csi_driver.arn
}

#
# EC2 Instance Profile
#

resource "aws_iam_instance_profile" "k8s_nodes" {
  name = "k8s-nodes-instance-profile"
  role = aws_iam_role.k8s_nodes.name

  tags = {
    Name        = "k8s-nodes-instance-profile"
    Environment = "lab"
    Component   = "kubernetes"
  }
}