locals {
  nodes = {
    k8s-cp1 = {
      role   = "control-plane"
      subnet = aws_subnet.k8s_az1.id
    }

    k8s-cp2 = {
      role   = "control-plane"
      subnet = aws_subnet.k8s_az2.id
    }

    k8s-worker1 = {
      role   = "worker"
      subnet = aws_subnet.k8s_az1.id
    }
  }
}

resource "aws_instance" "k8s" {
  for_each = local.nodes

  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = each.value.subnet
  vpc_security_group_ids      = [aws_security_group.k8s.id]
  key_name                    = var.key_name
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.k8s_nodes.name

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  tags = {
    Name = each.key
    Role = each.value.role
  }
}
resource "aws_instance" "haproxy" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = aws_subnet.k8s_az1.id

  vpc_security_group_ids = [
    aws_security_group.haproxy.id
  ]

  key_name = var.key_name

  associate_public_ip_address = true

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }

  tags = {
    Name        = "k8s-haproxy"
    Role        = "load-balancer"
    Component   = "kubernetes-api"
    Environment = "lab"
  }
}