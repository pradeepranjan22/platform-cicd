resource "aws_route53_zone" "k8s_private" {
  name = "k8s.internal"

  vpc {
    vpc_id = aws_vpc.k8s.id
  }

  tags = {
    Name = "k8s-private-dns"
  }
}

resource "aws_route53_record" "k8s_api" {
  zone_id = aws_route53_zone.k8s_private.zone_id
  name    = "api.k8s.internal"
  type    = "A"
  ttl     = 30

  records = [
    aws_instance.haproxy.private_ip
  ]
}