Install ansible and configure on hot machine:
1. sudo apt install ansible-core
2. mkdir -mv /etc/ansible
3. chown alam:alam -Rv /etc/ansible
4. Create ansible config file:
tee /etc/ansible/ansible.cfg <<EOF
[defaults]
inventory=/etc/ansible/inventory.ini
remote_user=ubuntu
ask_pass=false

[privilege_escalation]
become=true
become_method=sudo
become_user=root
become_ask_pass=false
EOF

Create ansible inventory:
1. Create ansible inventory: 
tee /etc/ansible/inventory.ini <<EOF
[k8s-master]
<public_ips_master>
[k8s-worker]
<public_ips_worker>
EOF
2. List all the inventory: ansible-inventory --list
3. Ping all hosts: ansible k8s_master -m ping
4. Check machine uptime:  ansible k8s_master -b -m command -a 'uptime' [b: become]

Extract kubernetes dashboard token:-
kubectl get secret admin-user -n kubernetes-dashboard -o jsonpath={".data.token"} | base64 -d > dashboard_token.txt
