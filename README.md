📘 Enterprise DevOps Platform
🚀 Overview

The Enterprise DevOps Platform is a full CI/CD and Kubernetes-based deployment project demonstrating modern DevOps practices including containerization, orchestration, automation, and observability.

It showcases end-to-end delivery of a cloud-native application using:

Docker for containerization
Kubernetes for orchestration
Helm for deployment management
GitHub Actions / CI pipelines (optional extension)
Flask as backend service
🏗️ Architecture
Developer
   ↓
GitHub Repo
   ↓
CI/CD Pipeline (Build & Test)
   ↓
Docker Image (Docker Hub / Minikube)
   ↓
Kubernetes Cluster (Minikube)
   ↓
Helm Deployment
   ↓
Service (NodePort / Port Forward)
   ↓
Application (Flask API)
⚙️ Tech Stack
Containers: Docker
Orchestration: Kubernetes (Minikube)
Package Manager: Helm
CI/CD: GitHub Actions / Manual build flow
Backend: Python Flask
Registry: Docker Hub
OS: Linux (WSL Ubuntu)
📦 Features
Containerized Flask application
Kubernetes deployment using Helm charts
NodePort service exposure
Health endpoint for monitoring
Readiness & liveness probe support
Rolling updates via Helm
Port-forward support for local testing
Full debugging and observability workflow
🚀 Deployment Guide
1️⃣ Clone Repository
git clone https://github.com/<your-username>/enterprise-devops-platform.git
cd enterprise-devops-platform
2️⃣ Build Docker Image
eval $(minikube docker-env)

docker build -t tummie/enterprise-devops-app:develop app/
3️⃣ Deploy with Helm
helm install devops-app ./helm/devops-app -n enterprise-devops --create-namespace

Upgrade:

helm upgrade devops-app ./helm/devops-app -n enterprise-devops
4️⃣ Check Deployment
kubectl get pods -n enterprise-devops
kubectl get svc -n enterprise-devops
helm list -A
🌐 Access Application
Option 1: NodePort
minikube ip

Open:

http://<minikube-ip>:30080
http://<minikube-ip>:30080/health
Option 2: Port Forward (Local Dev)
kubectl port-forward svc/devops-app-enterprise-devops 5000:5000 -n enterprise-devops

Access:

http://localhost:5000
http://localhost:5000/health
🩺 Health Check
curl http://localhost:5000/health

Response:

{
  "status": "healthy"
}
🔍 Troubleshooting
View Pods
kubectl get pods -n enterprise-devops
Logs
kubectl logs <pod-name> -n enterprise-devops
Events
kubectl get events -n enterprise-devops --sort-by=.metadata.creationTimestamp
Restart Deployment
kubectl rollout restart deployment devops-app -n enterprise-devops
📸 Screenshots (Add These)
kubectl get pods
kubectl get svc
Helm release status
Browser /health endpoint
Port-forward working
🧠 Key DevOps Learnings
Kubernetes deployment lifecycle management
Helm chart packaging and versioning
Docker image build and registry workflow
Debugging DNS, image pull, and probe failures
Service exposure via NodePort and port-forward
Real-world production troubleshooting
🔥 Resume Impact Statement

Built and deployed a containerized Flask application using Docker, Kubernetes, and Helm. Implemented CI/CD-style workflows, automated deployments, health probes, and troubleshooting of real-world cluster issues including DNS failures, ImagePullBackOff, and readiness probe misconfigurations.

🚀 Author

Itumeleng Kefeletswe
DevOps Engineer | Cloud & Platform Engineering
Gaborone, Botswana
