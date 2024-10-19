region           = "ap-south-1"
project          = "k8s_aws"
instance_name    = "ubuntu-vm-worker1"
vm_count         = 1
enable_public_ip = true
launch_template  = "launch-template-ubuntu" # for rhel bastion-rhel
root_volume_size = 10
vpc_name         = "default"
subnet_name      = "subnet-1"
spot_instance    = true
private_ip = "172.31.0.6" # Starting digit of private ip ( will increase last digit based on count value).
security_group   = "default-sg"
instance_type    = "t3a.small"
iam_instance_profile = "ec2-full-policy"
