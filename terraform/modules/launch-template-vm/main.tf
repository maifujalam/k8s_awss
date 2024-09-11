locals {
  aws_subnet=var.subnet_name
}

resource "aws_instance" "vm" {
  count = var.vm_count
  launch_template {
    name = var.launch_template
  }
  subnet_id = data.aws_subnet.selected_subnet.id
  instance_type = var.instance_type
  associate_public_ip_address = var.enable_public_ip
  root_block_device {
    volume_size = var.root_volume_size
    delete_on_termination = true
  }
  tags = {
    Name =  "${var.instance_name}-${count.index+1}"
    Owner      = var.owner
    project = var.project
    createdBy  = "terraform"
    ModulePath = path.module
    CWD        = path.cwd
  }
  instance_market_options {
    market_type = var.spot_instance? "spot" : null
  }
}
