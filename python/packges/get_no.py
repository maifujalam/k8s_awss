from kubernetes import client, config

config.load_kube_config()

v1 = client.CoreV1Api()

print("Listing nodes:")
nodes = v1.list_node()
for node in nodes.items:
    print(f"Node Name: {node.metadata.name}")
