data aws_ami image {
  most_recent      = true
  owners           = ["self", "309956199498", "aws-marketplace", "amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-2012-R2_RTM-English-64Bit-Base-*"]
  }
}

output ami_used {
  value =  data.aws_ami.image.id
}
