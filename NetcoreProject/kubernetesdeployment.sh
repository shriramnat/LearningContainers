export NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 6 | head -n 1)
echo "TAG: $NEW_UUID"
docker-compose build

docker tag aspnetapp:latest shriramnat/aspnetapp:$NEW_UUID
docker push shriramnat/aspnetapp:$NEW_UUID

sed "s/##TAG##/${NEW_UUID}/g" <k8sDeploy-template.yaml >k8sDeploy.yaml

kubectl apply -f k8sDeploy.yaml

kubectl get deployment -o wide


# kubectl describe services/dotnetapp
# kubectl expose deployment/dotnetapp --type="NodePort" --port 80
# export NODE_PORT=$(kubectl get services/dotnetapp-svc -o jsonpath='{.spec.ports[0].nodePort}')
# echo NODE_PORT=$NODE_PORT

# kubectl apply -f testdeploy.yaml