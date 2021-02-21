# 1. Deployment yaml with replica set 1 of image NodeJs from docker hub
# 2. Service yaml attached to my deployment Nodejs and NodePort 30007 bind to 50000
# 3. Horizontal Pod Scaler is bind to deployment so that any cpu/load rise (50%) then scale to 5

:: Steps to apply

kubectl apply -f node-app.yaml
kubectl apply -f node-app-hpa.yaml
