# ============================================================
# Kubernetes Node Security Group
# ============================================================

resource "aws_security_group" "k8s" {
  name        = "k8s-lab-sg"
  description = "Security group for Kubernetes lab"
  vpc_id      = aws_vpc.k8s.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr]
  }

  ingress {
    description = "Kubernetes internal traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  ingress {
    description = "Kubernetes API"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr]
  }

  egress {
    description = "Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "k8s-lab-sg"
  }
}


# ============================================================
# Kubernetes API NLB Security Group
# ============================================================

resource "aws_security_group" "k8s_api_nlb" {
  name        = "k8s-api-nlb-sg"
  description = "Security group for Kubernetes API internal NLB"
  vpc_id      = aws_vpc.k8s.id

  ingress {
    description = "Kubernetes API from VPC"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.k8s.cidr_block]
  }

  egress {
    description = "Allow NLB outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "k8s-api-nlb-sg"
    Component = "kubernetes-api"
  }
}


# ============================================================
# HAProxy -> Kubernetes API
# ============================================================

resource "aws_vpc_security_group_ingress_rule" "k8s_api_from_haproxy" {
  security_group_id            = aws_security_group.k8s.id
  referenced_security_group_id = aws_security_group.haproxy.id

  from_port   = 6443
  to_port     = 6443
  ip_protocol = "tcp"

  description = "Kubernetes API from HAProxy"
}