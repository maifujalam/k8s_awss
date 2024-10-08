1. Clone repo: git clone https://github.com/maifujalam/k8s_aws.git
2. git pull --rebase origin k8s_v1.1

To create Ubuntu NAT Instance [ https://docs.aws.amazon.com/vpc/latest/userguide/work-with-nat-instances.html#create-nat-ami ] :-
1. Create elastic-ip: terraform/network/nat-gateway 
2. Create ubuntu NAT VM: terraform/launch-template-vms/ubuntu-vms-nat with elastic IP.
3. SSH to the NAT VM: ssh -o ServerAliveInterval=5 -i ~/.ssh/id_rsa ubuntu@<elastic_ip>
4. Run script to setup nat: shellscripts/nat-forward.sh
5. make sure instance source & destination is stoped: action->networking->Change Source Destination 
   Check-> Make stop check bock tick (enabled the tick) and save.
6. Create entry in the route table, make entry in dor private subnet with below rules:
     0.0.0.0/0  eni-03250
     172.31.0.0/16   local
7. Update the NAT instance  Security group with:- 
   Inbound: 22,80,443,
   Outbounbd: 8,443 
