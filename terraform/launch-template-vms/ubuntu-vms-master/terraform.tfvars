region               = "ap-south-1"
project              = "k8s_aws"
instance_name        = "k8s-master"
vm_count             = 1
enable_public_ip     = false
launch_template = "launch-template-ubuntu" # for rhel bastion-rhel
root_volume_size     = 15
vpc_name             = "default"
subnet_name          = "subnet-2"
spot_instance        = false
instance_type        = "t3a.medium"
private_ip = "172.31.0.37" # Starting digit of private ip ( will increase last digit based on count value).
security_group       = "default-sg"
iam_instance_profile = "ec2-full-policy"
