region           = "ap-south-1"
project          = "k8s_aws"
instance_name    = "ubuntu-vm-master"
vm_count         = 1
enable_public_ip = true
launch_template = "launch-template-ubuntu" # for rhel bastion-rhel
root_volume_size = 15
vpc_name         = "default"
subnet_name      = "subnet-1"
spot_instance    = true
instance_type    = "t3a.medium"
private_ip = "172.31.0.5" # Starting digit of private ip ( will increase last digit based on count value).
security_group   = "default-sg"
