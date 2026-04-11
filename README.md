**📘 Enterprise DevOps Platform

![CI/CD Pipeline](https://github.com/tumikef/enterprise-devops-platform/actions/workflows/ci.yml/badge.svg)
![Docker](https://img.shields.io/badge/Docker-Enabled-blue)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Deployed-blue)
![Helm](https://img.shields.io/badge/Helm-Package-green)

📌 Overview

The Enterprise DevOps Platform is a full end-to-end DevOps project demonstrating modern cloud-native engineering practices using:

Containerization (Docker)
Kubernetes orchestration (Minikube)
Helm package management
CI/CD automation (GitHub Actions)
Observability & health checks
Real-world debugging & production issue handling

This project simulates a production-grade deployment pipeline for a microservice-based application.

**🏗️ Architecture**

<img width="1024" height="1536" alt="CI_CD pipeline for Flask deployment" src="https://github.com/user-attachments/assets/2e889159-d2de-4e4e-b733-c90116e20fad" />


**⚙️ Tech Stack**

| Layer            | Technology            |
| ---------------- | --------------------- |
| Application      | Python (Flask)        |
| Containerization | Docker                |
| Orchestration    | Kubernetes (Minikube) |
| Package Manager  | Helm                  |
| CI/CD            | GitHub Actions        |
| Registry         | Docker Hub            |
| OS               | Linux (WSL Ubuntu)    |


**📦 Application Endpoints**

| Endpoint  | Description         |
| --------- | ------------------- |
| `/`       | Home route          |
| `/health` | Health status check |


**📦 Features**

Containerized Flask application
Kubernetes deployment using Helm charts
NodePort service exposure
Health endpoint for monitoring
Readiness & liveness probe support
Rolling updates via Helm
Port-forward support for local testing
Full debugging and observability workflow

**🚀 Deployment Guide**

**1️⃣ Clone Repository**

git clone https://github.com/<your-username>/enterprise-devops-platform.git
cd enterprise-devops-platform

**2️⃣ Build Docker Image**

eval $(minikube docker-env)
docker build -t <dockerhub_ID>/enterprise-devops-app:develop app/

**3️⃣ Deploy with Helm**

helm install devops-app ./helm/devops-app -n enterprise-devops --create-namespace

Upgrade:
helm upgrade devops-app ./helm/devops-app -n enterprise-devops

**4️⃣ Check Deployment**

kubectl get pods -n enterprise-devops
<img width="1230" height="108" alt="image" src="https://github.com/user-attachments/assets/35bc01b9-5800-4fe1-a728-d9d6adc33fe1" />

kubectl get svc -n enterprise-devops
<img width="1230" height="91" alt="image" src="https://github.com/user-attachments/assets/c18724b7-3a22-4045-bdbd-a8968da012f2" />

helm list -A
<img width="1427" height="115" alt="image" src="https://github.com/user-attachments/assets/36d96af4-cd0a-49f5-ae0d-a138b3b5f390" />

**
🌐 Access Application**
Option 1: NodePort
minikube ip

Open:

http://<minikube-ip>:30080
http://<minikube-ip>:30080/health
Option 2: Port Forward (Local Dev)
kubectl port-forward svc/devops-app-enterprise-devops 5000:5000 -n enterprise-devops

**Access:**

http://localhost:5000
http://localhost:5000/health

**🩺 Health Check**
curl http://localhost:5000/health

Response:

{
  "status": "healthy"
}

**🔍 Troubleshooting**
View Pods
kubectl get pods -n enterprise-devops
Logs
kubectl logs <pod-name> -n enterprise-devops
Events
kubectl get events -n enterprise-devops --sort-by=.metadata.creationTimestamp
Restart Deployment
kubectl rollout restart deployment devops-app -n enterprise-devops

**📸 Screenshots**

CI/CD pipeline success (GitHub Actions)

kubectl get pods
<img width="1096" height="111" alt="image" src="https://github.com/user-attachments/assets/17bcd068-629f-47ac-ad22-17735f59cb64" />

kubectl get svc
<img width="1091" height="87" alt="image" src="https://github.com/user-attachments/assets/cfa0d8e1-8d5b-40b9-9f0f-f58b6c13bdef" />

Helm release status

<img width="1465" height="67" alt="image" src="https://github.com/user-attachments/assets/72af9b4d-6e35-4574-b6c5-3f75beebc39f" />

Browser/health endpoint

<img width="835" height="241" alt="image" src="https://github.com/user-attachments/assets/3458054c-9e45-4ea3-90dc-700f7ee77607" />

Port-forward working

<img width="1411" height="95" alt="image" src="https://github.com/user-attachments/assets/25ce93ea-5978-4b50-90f2-dccbe95b7ec2" />

<img width="805" height="197" alt="image" src="https://github.com/user-attachments/assets/efdad905-84f4-409e-9c3e-58d4259c4143" />

**Github Actions K8s deployments test**
<img width="1519" height="194" alt="image" src="https://github.com/user-attachments/assets/1cfdd17f-5cd3-40cf-847f-2ceec688e238" />


**Key DevOps Achievements**
Reduced deployment friction via Helm automation
Improved system reliability through Kubernetes health probes
Implemented CI/CD automation using GitHub Actions
Resolved real-world issues:
DNS failures in container builds
ImagePullBackOff errors
Kubernetes readiness probe failures
Achieved repeatable and scalable deployment workflow

**🧠 Key Learnings**

Kubernetes workload lifecycle management
Helm chart structuring and deployment patterns
Container networking and DNS troubleshooting
CI/CD pipeline integration with Docker builds
Production-grade debugging techniques

**🚀 Author**
Joy Itumeleng Kefeletswe
DevOps Engineer | Cloud & Platform Engineering



