# Tekton CI Pipeline Examples

# Install Tekton Controller and CRD
```
kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
```

# Install Tekton Dashbaord
```
kubectl apply --filename https://storage.googleapis.com/tekton-releases/dashboard/latest/release.yaml
Kubectl proxy

```
# Browse the Tekton Dashboard
http://localhost:8001/api/v1/namespaces/tekton-pipelines/services/tekton-dashboard:http/proxy/#/about 

# Pipeline Flow
1. Clone
2. Lint
3. Test
4. build
5. push 

# Apply Pipeline 
```
bash apply.sh <NAMESPACE>

```

# Destory Pipeline
```
bash delete.sh <NAMESPACE>

```