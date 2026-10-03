# ============================================================
# HAProxy Security Group
# ============================================================

resource "aws_security_group" "haproxy" {
  name        = "k8s-haproxy-sg"
  description = "Security group for Kubernetes API HAProxy"
  vpc_id      = aws_vpc.k8s.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr]
  }

  ingress {
    description = "Kubernetes API"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.k8s.cidr_block]
  }

  egress {
    description = "Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "k8s-haproxy-sg"
    Component = "kubernetes-api"
  }
}


# ============================================================
# HAProxy Outputs
# ============================================================

output "haproxy_private_ip" {
  description = "HAProxy private IP"
  value       = aws_instance.haproxy.private_ip
}

output "haproxy_public_ip" {
  description = "HAProxy public IP"
  value       = aws_instance.haproxy.public_ip
}