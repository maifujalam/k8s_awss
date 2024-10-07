sudo apt install -y iptables iptables-persistent
cat <<EOF | sudo tee /etc/sysctl.d/nat.conf
  net.ipv4.ip_forward                 = 1
EOF
# Apply sysctl params without reboot
sudo sysctl --system

sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# make IP table persistent
sudo netfilter-persistent save
sudo netfilter-persistent reload

# Disable source destination  check for NAT instance: https://docs.aws.amazon.com/vpc/latest/userguide/work-with-nat-instances.html#EIP_Disable_SrcDestCheck
