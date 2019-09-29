resource "aws_route53_record" "internet" {
  zone_id = var.zone_id
  name    = "${var.ec2_name}-internet.${var.zone_name}"
  type    = "A"
  ttl     = "1"
  records = [aws_instance.ec2.public_ip]
}

resource "aws_route53_record" "public" {
  zone_id = var.zone_id
  name    = "${var.ec2_name}-pub.${var.zone_name}"
  type    = "A"
  ttl     = "1"
  records = [aws_instance.ec2.private_ip]
}
