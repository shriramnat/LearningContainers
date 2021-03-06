Docker Commands
==========================

    docker ps -a
    docker container prune

    docker ps -q | % { docker stop $_ }
    docker ps -q | % { docker rm $_ }

    docker build -t img-static-site-example .
    docker run -it -d -p 80:80 img-static-site-example

    New-Item -Name docker-compose.yml
    docker-compose up -d

    docker-compose build
    docker-compose up -d

    docker tag aspnetapp:latest shriramnat/aspnetapp:v1
    docker push shriramnat/aspnetapp:v1

Kubernetes Commands
=========================

## Basic

    minikube version

    minikube start

    kubectl version

    kubectl cluster-info

    kubectl get nodes

    kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1

    kubectl get deployments

    kubectl get pods

    kubectl describe pods

## Troubleshooting

**Get a Proxy setup to access containers**

    kubectl proxy

**Get name of the pod**

    export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
    echo Name of the Pod: $POD_NAME

**Access application**

    curl http://localhost:{port}/api/v1/namespaces/default/pods/$POD_NAME/proxy/

**Get Pod's logs**

    kubectl logs $POD_NAME

**Get ENVIRONMENT VARIABLES for pod**

    kubectl exec $POD_NAME env

**Bash session within the pod's container**

    kubectl exec -ti $POD_NAME bash


## Services 

    kubectl get services

    kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080
   
    kubectl describe services/kubernetes-bootcamp


    export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
    echo NODE_PORT=$NODE_PORT


    curl $(minikube ip):$NODE_PORT


    kubectl get pods -l run=kubernetes-bootcamp

    kubectl get services -l run=kubernetes-bootcamp


    export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
    echo Name of the Pod: $POD_NAME


    kubectl label pod $POD_NAME app=v1

    kubectl describe pods $POD_NAME

    kubectl get pods -l app=v1

    kubectl delete service -l run=kubernetes-bootcamp

    kubectl exec -ti $POD_NAME curl localhost:8080

## Scaling

    kubectl get rs

    kubectl scale deployments/kubernetes-bootcamp --replicas=4

    kubectl get pods -o wide

    export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')

    echo NODE_PORT=$NODE_PORT

    curl $(minikube ip):$NODE_PORT