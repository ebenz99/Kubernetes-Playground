# Using Redis with Kubernetes

1. Redis requires a deployment and a single service to expose it via a LoadBalancer to the outside
2. `kubectl apply -f redis-master.yaml` will deploy those resources. If running on minikube, use the `minikube tunnel` command to expose on an external IP