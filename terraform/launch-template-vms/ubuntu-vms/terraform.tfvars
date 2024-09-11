region           = "ap-south-1"
project          = "k8s_aws"
instance_name    = "ubuntu-vm"
vm_count         = 1
enable_public_ip = true
launch_template  = "launch-template-ubuntu" # for rhel bastion-rhel
root_volume_size = 10
vpc_name         = "default"
subnet_name      = "subnet-1"
spot_instance    = true

