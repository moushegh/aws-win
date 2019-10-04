variable client_type {}
variable client_name {}

module "win_client" {
  source                  = "./modules/aws-win/"
  ec2_type                = var.client_type
  ec2_ami                 = data.aws_ami.image.id
  ec2_name                = var.client_name
  ec2_public_subnet_id    = "${element(data.aws_subnet_ids.public.ids.*, 0)}"
  ec2_private_subnet_id   = "${element(data.aws_subnet_ids.private.ids.*, 0)}"
  ec2_public_subnet_cidrs = data.aws_subnet.private_subnets.*.cidr_block
  ec2_ssh_key_name        = var.ssh_key_name
  zone_name               = data.aws_route53_zone.selected.name
  zone_id                 = data.aws_route53_zone.selected.id
  source_security_group_id = aws_security_group.gluster.id

}

#output "Administrator_Password" {
#    value = "${rsadecrypt(module.win_client.password_data, file("../../../GLOBAL/keys/id_rsa_bam"))}"
#}
