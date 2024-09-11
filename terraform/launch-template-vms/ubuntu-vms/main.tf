module "ubuntu-vms" {
  source           = "../../modules/launch-template-vm"
  region           = var.region
  instance_name    = var.instance_name
  vm_count         = var.vm_count
  enable_public_ip = var.enable_public_ip
  launch_template  = var.launch_template
  root_volume_size = var.root_volume_size
}

