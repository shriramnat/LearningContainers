kubectl create -f .\testdeploy.yaml
#kubectl describe services/dotnetapp
# kubectl expose deployment/dotnetapp --type="NodePort" --port 80
export NODE_PORT=$(kubectl get services/dotnetapp-svc -o jsonpath='{.spec.ports[0].nodePort}')
echo NODE_PORT=$NODE_PORT

kubectl apply -f .\testdeploy.yaml