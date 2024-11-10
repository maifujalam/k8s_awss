import kubernetes

kubernetes.config.load_config()
client = kubernetes.client.CoreV1Api()

NAMESPACE="kube-system"

def get_po(namespace):
    print("Namespace:", namespace)
    obj = client.list_namespaced_pod(namespace=namespace)
    for pod in obj.items:
        print(pod.metadata.name)


if __name__ == '__main__':
    get_po(NAMESPACE)
