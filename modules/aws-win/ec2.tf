data template_file bootstrap_ec2 {
  template = "${file("${path.module}/files/user-data.tpl.yml")}"
}


resource aws_instance ec2 {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  key_name      = var.ec2_ssh_key_name

  subnet_id = var.ec2_public_subnet_id

  user_data         = data.template_file.bootstrap_ec2.rendered
  source_dest_check = true
  iam_instance_profile  = aws_iam_instance_profile.ec2.name

  associate_public_ip_address = true
  get_password_data = true
  vpc_security_group_ids = [
    aws_security_group.public.id,
    var.source_security_group_id,
  ]

  tags = {
    Name = "${var.ec2_name}"
  }
}

