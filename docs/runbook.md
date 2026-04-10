📘 Enterprise DevOps Platform — Quick Access Runbook

📌 1. Project Startup (Full Stack Bring-up)
# 1. Set namespace context (optional but recommended)
kubectl config set-context --current --namespace=enterprise-devops

# 2. Check Helm release
helm list -A

# 3. Ensure deployment is running
kubectl get pods -n enterprise-devops

# 4. Check services
kubectl get svc -n enterprise-devops
🚀 2. Start Application (Helm Deployment)
# Install (first time only)
helm install devops-app ./helm/devops-app -n enterprise-devops --create-namespace
# Upgrade (after changes)
helm upgrade devops-app ./helm/devops-app -n enterprise-devops
# Restart deployment (force refresh)
kubectl rollout restart deployment devops-app -n enterprise-devops
📦 3. Build & Deploy Docker Image
# Use Minikube Docker daemon
eval $(minikube docker-env)

# Build image
docker build -t tummie/enterprise-devops-app:develop app/

# Tag & push to Docker Hub (optional production flow)
docker push tummie/enterprise-devops-app:develop
🔍 4. Debugging Commands
# Check pods
kubectl get pods -n enterprise-devops

# Describe pod (errors, probes, image issues)
kubectl describe pod <pod-name> -n enterprise-devops

# View logs
kubectl logs <pod-name> -n enterprise-devops

# Check events (VERY IMPORTANT for probe failures)
kubectl get events -n enterprise-devops --sort-by=.metadata.creationTimestamp
🌐 5. Access Application
Option A — NodePort (Primary)
minikube ip

Then open:

http://<minikube-ip>:30080
http://<minikube-ip>:30080/health
Option B — Port Forward (YOU JUST USED THIS)
kubectl port-forward svc/devops-app-enterprise-devops 5000:5000 -n enterprise-devops

Then open:

http://localhost:5000
http://localhost:5000/health
🩺 6. Health Check Validation
curl http://localhost:5000/health

Expected output:

{"status": "healthy"}
📊 7. Helm Status Check
helm list -A
helm status devops-app -n enterprise-devops
🔁 8. Clean Restart (Emergency Fix)
kubectl delete pods --all -n enterprise-devops
kubectl rollout restart deployment devops-app -n enterprise-devops
🧹 9. Full Reset (Nuclear Option)
helm uninstall devops-app -n enterprise-devops
kubectl delete namespace enterprise-devops
