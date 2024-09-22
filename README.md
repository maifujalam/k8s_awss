# Self Manager Kubernetes on AWS

Self managed Kubernetes cluster on AWS with:- 
  - Calico
  - Cert Manager
  - Nginx Ingress
  - ArgoCD

Git Repository: git clone https://github.com/maifujalam/k8s_aws.git

# Setup master Node:-

## Terraform Infra Setup:-
1. Create Security Group: terraform/network/security-group
2. Create 1 EC2 instance of master (RHEL): terraform/launch-template-vms/rhel-vms-master
3. Create 1 EC2 instance of worker(RHEL): terraform/launch-template-vms/rhel-vms-worker
4. Make sure you have existing VPC,Public Subnet,Internet Gateway,Route Table with making subnet available to internet using
   Internet gateway (Public Subnet).
5. Create NAT gateway with Elastic IP: terraform/network/nat-gateway
6. Create Private route table: terraform/network/route-tables/private-route-table
7. Create Application Load Balancer with above security-group:
   terraform/network/application-load-balancer
8. Create target group,load_balancer_target_group_attachment and AWS load balancer listener on http:
   terraform/network/target-group-http
9. Create target group,load_balancer_target_group_attachment and AWS load balancer listener on https:
   terraform/network/target-group-https
10. Create an ec2 role of s3 full access and assign to master and worker vms.
11. Add the load balancer DNS to the Public route of *.maifuj.com.

## Kubernetes Cluster Setup

1. Create 2 RHEL vms using terraform.
2. SSH into vm and install ansible: sudo yum -y update && sudo yum -y install git wget unzip tree ansible-core (for ubuntu use apt)
3. SSH into worker node by:-
   a. SSH into master node.
   b. Create file for private key file: vi ~/.ssh/id_rsa
   c. Paste the key from local machine to the master machine.
   d. update the key permission: chmod 400 ~/.ssh/id_rsa
   e. SSh to work from master: ssh -o ServerAliveInterval=5 -i ~/.ssh/id_rsa ec2-user@172.31.0.6
4. Add master and worker node private ip entry to /etc/hosts:
   $ echo '172.31.0.5 master' | sudo tee -a /etc/hosts > /dev/null && echo '172.31.0.69 worker' | sudo tee -a /etc/hosts > /dev/null
5. Clone this git repo: $ git clone https://github.com/maifujalam/k8s_aws.git
6. Download packages: $ cd k8s_aws/shellscripts/ && sh 1_download-packages.sh
7. Configure crictl: $ sh 2_config_crictl.sh
8. Configure network: $ sh 3_configure_network.sh
9. Configure firewalld: $ sh 4-configure_firealld_selinux.sh
10. Download Kubernetes cluster images: $ sh 5_kubernetes_images.sh 
11. Configure kubectl and kubeconfg: $ sh 6_configure_kubectl.sh
12. Install helm: $ sudo sh 8_install_helm.sh
13. Add helm private repo: helm repo add public-helm-repository https://public-helm-repository-20231023095000508500000001.s3.ap-south-1.amazonaws.com/
14. Boostrap Kubernetes Argocd: sudo sh k8s_master_bootstrap_argocd.sh
15. Extract ArgoCD password: kubectl -n argo-cd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" |
   base64 -d for username admin

# Setup Worker node:-
1. Check worker is having connectivity and ssh into it: ping worker
2. Clone Git Project repo: git clone https://github.com/maifujalam/k8s_aws.git
2. copy packages to worker: scp -i ~/.ss/id_rsa -r packages ec2-user@worker:k8s/
3. Install packages in worker: 
