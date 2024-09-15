region = "ap-south-1"
instance_name = "k8s_worker"
vm_count = 1
enable_public_ip = false
launch_template = "launch-template-rhel"  # for rhel bastion-rhel
root_volume_size = 15
vpc_name = "default"
subnet_name = "subnet-1"
spot_instance = true
instance_type = "t3a.small"
project = "k8s_aws"
private_ip = "172.31.0.6" # Starting digit of private ip ( will increase last digit based on count value).
