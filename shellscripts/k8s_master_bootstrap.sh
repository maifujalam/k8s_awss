#!/bin/bash
USER=ec2-user
PROJECT_PATH=/home/$USER/k8s_aws
FILE=/home/$USER/.kube/config
K8S_VERSION=v1.30.4

echo $FILE

#if [ -f "$FILE" ]; then
#    printf "\n Deleting existing k8s Cluster...\n"
#    kubeadm reset --force
#fi
######################## Init K8s Cluster ########################
#printf "\nInitializing Cluster...\n"
#  kubeadm init --config $PROJECT_PATH/k8s/$K8S_VERSION/kubeadm-init/init-default.yaml
#
#printf "\nCopying Config Files...\n"
#  su - $USER -c 'mkdir -p $HOME/.kube'
#  su - $USER -c 'sudo cp -vf /etc/kubernetes/admin.conf $HOME/.kube/config'
#  su - $USER -c 'sudo cp -vf /etc/kubernetes/admin.conf $HOME/config'
#  su - $USER -c 'sudo chown $(id -u):$(id -g) $HOME/.kube/config'
#
#printf "\nCooling down for 5 seconds...\n"
#sleep 5

####################### Install Calico Cluster ########################

printf "\nInstalling Tigera Operator for Calico CNI...\n"
  su - $USER -c "helm install calico '$PROJECT_PATH'/k8s/'$K8S_VERSION'/manifests/tigera-operator --create-namespace --namespace tigera-operator"

#printf "\nInstalling Calico CNI with VXLAN...\n"
#  su - vagrant -c 'kubectl apply -f /vagrant/manifests/tigera-operator/calico-install-vxlan.yaml'

printf "\nCooling down for 5 seconds...\n"
sleep 5

####################### Install Kube-VIP ########################

printf "\nInstalling Kube-vip...\n"
   su - $USER -c "helm install kube-vip --create-namespace --namespace kube-vip '$PROJECT_PATH'/k8s/'$K8S_VERSION'/manifests/kube-vip"
   su - $USER -c "helm install kube-vip-cloud-provider --namespace kube-vip '$PROJECT_PATH'/k8s/'$K8S_VERSION'/manifests/kube-vip-cloud-provider"

printf "\nCooling down for 5 seconds...\n"
sleep 5

##################### Install Metric Server ########################

printf "\nInstalling cert-manager...\n"
   su - $USER -c "helm install cert-manager --create-namespace --namespace cert-manager '$PROJECT_PATH'/k8s/'$K8S_VERSION'/manifests/cert-manager"
   su - $USER -c "kubectl apply -f '$PROJECT_PATH'/k8s/'$K8S_VERSION'/manifests/cert-manager/self-sign-issuer.yaml "

printf "\nCooling down for 5 seconds...\n"
sleep 5

####################### Install ingress-nginx ########################
printf "\nInstalling ingress-nginx...\n"
   su - $USER -c "helm -n ingress-nginx install ingress-nginx --create-namespace --namespace ingress-nginx '$PROJECT_PATH'/k8s/'$K8S_VERSION'/manifests/ingress-nginx"

printf "\nCooling down for 10 seconds...\n"
  sleep 10

####################### Install Metric Server ########################
printf "\nInstalling metric server...\n"
   su - $USER -c "helm -n kube-system install metrics-server '$PROJECT_PATH'/k8s/'$K8S_VERSION'/manifests/metrics-server"

printf "\nCooling down for 5 seconds...\n"
sleep 5

####################### Install k8s-dashboard########################

printf "\nInstalling k8s Dashboard...\n"
  su - $USER -c 'helm install kubernetes-dashboard '$PROJECT_PATH'/k8s/'$K8S_VERSION'/manifests/kubernetes-dashboard -n kubernetes-dashboard --create-namespace'
printf "\nCooling down for 5 seconds...\n"
  sleep 5

####################### Create k8s-dashboard user ########################
printf "\n Extracting dashboard token\n"
  su - $USER -c "kubectl -n kubernetes-dashboard create token admin-user > '$PROJECT_PATH'/k8s/'$K8S_VERSION'/dashboard_token.txt"

printf "\nAppend token in kubeconfig file.\n"
  su - $USER -c "sed -i "/client-key-data/a\    token: $(cat '$PROJECT_PATH'/k8s/'$K8S_VERSION'/dashboard_token.txt)' '$PROJECT_PATH'/k8s/'$K8S_VERSION'/config"

printf "\nCooling down for 5 sec..\n"
  sleep 5

####################### Install Kube Prometheus Stack ########################
printf "\nInstalling KubePrometheusStack..\n"
  su - $USER -c "helm -n monitoring install kube-prometheus-stack '$PROJECT_PATH'/k8s/'$K8S_VERSION'/manifests/kube-prometheus-stack --create-namespace"

printf "\nCooling down for 5 seconds...\n"
  sleep 5

####################### Install Grafana ########################
printf "\nInstalling Prometheus Blackbox-Exporter..\n"
  su - $USER -c "helm -n monitoring install prometheus-blackbox-exporter '$PROJECT_PATH'/k8s/'$K8S_VERSION'/manifests/prometheus-blackbox-exporter"

printf "\nCooling down for 5 seconds...\n"
  sleep 5

printf "\nInstalling Local Storage Provisioner...\n"
  su - $USER -c "kubectl apply -f '$PROJECT_PATH'/k8s/'$K8S_VERSION'/manifests/local-path-provisioner.yaml"

printf "\nCooling down for 5 seconds...\n"
  sleep 5

####################### Create k8s-dashboard user ########################
printf "\nConfiguring kubectl.\n"
  su - $USER -c "sh '$PROJECT_PATH'/k8s/'$K8S_VERSION'/ShellScripts/6_configure_kubectl.sh"
printf "\n-------K8s master Initialized Successfully-----\n"
