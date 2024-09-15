Kubernetes on AWS

1. Create 2 RHEL vms using terraform.
2. SSH into vm and install ansible: sudo yum -y update && sudo yum -y install git wget unzip tree ansible-core
3. Add master node provate ip to /etc/hosts: echo '172.31.0.5 master' | sudo tee -a /etc/hosts > /dev/null
4. Extract ArgoCD password: kubectl -n argo-cd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" |
   base64 -d for username admin

Terraform Setup:-

1. Create 1 EC2 instance of master: terraform/launch-template-vms/rhel-vms-master
2. Create 1 EC2 instance of worker: terraform/launch-template-vms/rhel-vms-worker
3. Make sure you have existing VPC,Public Subnet,Internet Gateway,Route Table making subnet available to internet using
   Internet gateway.
4. Create Security Group: /home/alam/PycharmProjects/k8s_aws/terraform/network/security-group
5. Create Application Load Balancer with above security-group:
   /home/alam/PycharmProjects/k8s_aws/terraform/network/application-load-balancer
6. Create target group,load_balancer_target_group_attachment and AWS load balancer listener on http:
   /home/alam/PycharmProjects/k8s_aws/terraform/network/target-group-http
7. Create target group,load_balancer_target_group_attachment and AWS load balancer listener on https:
   /home/alam/PycharmProjects/k8s_aws/terraform/network/target-group-https
8. 
