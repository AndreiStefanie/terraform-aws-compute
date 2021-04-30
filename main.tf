data "aws_ami" "this" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "random_id" "this" {
  count = var.instance_count

  byte_length = 2
  keepers = {
    key_name = var.key_name
  }
}

resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = var.public_key_material
}

resource "aws_instance" "this" {
  count = var.instance_count

  instance_type          = var.instance_type
  ami                    = data.aws_ami.this.id
  key_name               = aws_key_pair.this.id
  vpc_security_group_ids = [var.security_group]
  subnet_id              = element(var.subnets, count.index)

  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    Name = "tf-instance-${random_id.this[count.index].dec}"
  }
}
