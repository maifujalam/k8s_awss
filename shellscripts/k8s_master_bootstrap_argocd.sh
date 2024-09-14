#!/bin/bash
USER=ec2-user
PROJECT_PATH=/home/$USER/k8s_aws
FILE=/home/$USER/.kube/config
K8S_VERSION=v1.30.4

echo $FILE

if [ -f "$FILE" ]; then
    printf "\n Deleting existing k8s Cluster...\n"
    kubeadm reset --force
fi
####################### Init K8s Cluster ########################
printf "\nInitializing Cluster...\n"
  kubeadm init --config $PROJECT_PATH/k8s/$K8S_VERSION/kubeadm-init/init-default.yaml

printf "\nCopying Config Files...\n"
  su - $USER -c 'mkdir -p $HOME/.kube'
  su - $USER -c 'sudo cp -vf /etc/kubernetes/admin.conf $HOME/.kube/config'
  su - $USER -c 'sudo cp -vf /etc/kubernetes/admin.conf $HOME/config'
  su - $USER -c 'sudo chown $(id -u):$(id -g) $HOME/.kube/config'

printf "\nCooling down for 5 seconds...\n"
sleep 5

####################### Install Calico Cluster ########################

printf "\nInstalling Tigera Operator for Calico CNI...\n"
  su - $USER -c "helm install calico '$PROJECT_PATH'/k8s/'$K8S_VERSION'/manifests/tigera-operator --create-namespace --namespace tigera-operator"

#printf "\nInstalling Calico CNI with VXLAN...\n"
#  su - vagrant -c 'kubectl apply -f /vagrant/manifests/tigera-operator/calico-install-vxlan.yaml'

printf "\nCooling down for 5 seconds...\n"
sleep 5


###################### Install Cert Manager ########################
#
#printf "\nInstalling cert-manager...\n"
#   su - $USER -c "helm install cert-manager --create-namespace --namespace cert-manager '$PROJECT_PATH'/k8s/'$K8S_VERSION'/manifests/cert-manager"
#   su - $USER -c "kubectl apply -f '$PROJECT_PATH'/k8s/'$K8S_VERSION'/manifests/cert-manager/self-sign-issuer.yaml "
#
#printf "\nCooling down for 5 seconds...\n"
#sleep 5

####################### Install ingress-nginx ########################
printf "\nInstalling ingress-nginx...\n"
   su - $USER -c "helm -n ingress-nginx install ingress-nginx --create-namespace --namespace ingress-nginx '$PROJECT_PATH'/k8s/'$K8S_VERSION'/manifests/ingress-nginx"

printf "\nCooling down for 10 seconds...\n"
  sleep 10

####################### Install ingress-nginx ########################
printf "\nInstalling helloworld app ..\n"
   su - $USER -c "helm install helloworld '$PROJECT_PATH'/k8s/'$K8S_VERSION'/manifests/hello-kubernetes"

######################### Install Argocd ########################
#printf "\nInstalling ArgoCD...\n"
#su - vagrant -c 'helm -n argo-cd install argo-cd /vagrant/manifests/argo-cd-7.4.3.tgz --create-namespace --namespace argo-cd'
#
#printf "\nInstalling Argocd Apps ...\n"
#  su - vagrant -c 'kubectl apply -f /vagrant/manifests/default-applications.yaml'
#
#printf "\n-------K8s master Initialized Successfully-----\n"
