resource "helm_release" "spring-mongo" {
  name       = "springapp"
  #create_namespace = true
  namespace  = "konoha" #konoha
  repository = "https://konoha-23.github.io/springapp-mongo/"
  chart      = "spring-mongo"
  values = [
    "${file("spring-mongo.yml")}"
  ]
}

#


/*1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=spring-mongo,app.kubernetes.io/instance=spring-mongo" -o jsonpath="{.items[0].metadata.name}")
  export CONTAINER_PORT=$(kubectl get pod --namespace default $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl --namespace default port-forward $POD_NAME 8080:$CONTAINER_PORT*/
