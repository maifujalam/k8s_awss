Kubernetes on AWS
1. Create 2 RHEL vms using terraform.
2. SSH into vm and install ansible: sudo yum -y update && sudo yum -y install git wget unzip tree ansible-core 
3. Add master node provate ip to /etc/hosts: echo '172.31.0.5 master' | sudo tee -a /etc/hosts > /dev/null
4. Extract ArgoCD password: kubectl -n argo-cd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d  for username admin
5. 
