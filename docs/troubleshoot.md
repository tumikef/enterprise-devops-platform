**🛠️ Troubleshooting & Issues Resolved**

This section documents real issues encountered during the implementation of the Enterprise DevOps Platform and how they were resolved.

1️⃣ DNS Resolution Failure in WSL & Docker Build
❌ Issue

**Docker builds failed with errors such as:**

Temporary failure in name resolution
Could not find a version that satisfies the requirement flask

This occurred during pip install inside the Docker build process.

🔍 Root Cause
WSL DNS configuration was broken
Docker container had no external internet access
/etc/resolv.conf was incorrectly generated
✅ Solution

Reconfigured DNS manually in WSL:

sudo nano /etc/resolv.conf

Added:

nameserver 8.8.8.8
nameserver 1.1.1.1

Disabled auto-generation:

sudo nano /etc/wsl.conf
[network]
generateResolvConf = false

Restarted WSL and system:

wsl --shutdown
🎯 Result
Docker build successfully pulled dependencies
Flask installed correctly
Image built successfully
2️⃣ Kubernetes ImagePullBackOff (Docker Image Issues)
❌ Issue

Pods were stuck in:

ImagePullBackOff
ErrImagePull
🔍 Root Cause
Mismatch between Docker image name and Kubernetes deployment reference
Image not correctly pushed to Docker Hub
Tag inconsistency (latest vs develop)
✅ Solution

Standardized image naming:

docker tag enterprise-devops-app:develop tummie/enterprise-devops-app:develop
docker push tummie/enterprise-devops-app:develop

Updated Helm values:

image:
  repository: tummie/enterprise-devops-app
  tag: develop

Restarted deployment:

kubectl rollout restart deployment devops-app -n enterprise-devops
🎯 Result
Pods successfully pulled correct image
Application started successfully
3️⃣ Readiness Probe Failure (HTTP 404)
❌ Issue
Readiness probe failed: HTTP probe failed with statuscode: 404
🔍 Root Cause
/health endpoint was missing in Flask application
Kubernetes probe was calling a non-existent route
✅ Solution

Added health endpoint:

@app.route("/health")
def health():
    return {"status": "healthy"}

Rebuilt and redeployed application:

docker build -t tummie/enterprise-devops-app:develop app/
helm upgrade devops-app ./helm/devops-app -n enterprise-devops
🎯 Result
Liveness and readiness probes passed
Pod became fully healthy (1/1 Running)
4️⃣ Helm Deployment Confusion (Upgrade vs Install)
❌ Issue

Attempted upgrade failed:

"devops-app" has no deployed releases
🔍 Root Cause
Helm release did not exist yet in the cluster
Incorrect use of helm upgrade instead of helm install
✅ Solution

Initial deployment:

helm install devops-app ./helm/devops-app -n enterprise-devops --create-namespace

Subsequent updates:

helm upgrade devops-app ./helm/devops-app -n enterprise-devops
🎯 Result
Helm release successfully created and managed
Versioned deployments working correctly
5️⃣ Namespace Confusion (Duplicate Deployments)
❌ Issue

Multiple deployments appeared in different namespaces (default and enterprise-devops).

🔍 Root Cause
Deployment executed without specifying namespace initially
Helm deployment created separate managed resources
✅ Solution

Cleaned up incorrect resources:

kubectl delete deployment enterprise-devops-app
kubectl delete svc enterprise-devops-app-service

Ensured consistent namespace usage:

kubectl config set-context --current --namespace=enterprise-devops
🎯 Result
Single controlled deployment environment
Reduced confusion and duplication
🧠 Key Takeaways
DNS issues can break Docker builds silently
Kubernetes image tags must always match deployment config
Health endpoints are critical for probes
Helm requires correct lifecycle management (install vs upgrade)
Namespace discipline is essential in multi-environment setups
