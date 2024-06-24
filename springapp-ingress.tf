##NGINX

resource "kubernetes_ingress_v1" "springapp-ingress" {
  wait_for_load_balancer = true
  metadata {
    name = "springapp"
    namespace = "springapp"
    annotations = {
        "cert-manager.io/cluster-issuer" = "springapp-issuer"
  }
  }
  spec {
    ingress_class_name = "nginx"
    tls {
      secret_name = "springapp-secret"
      hosts = ["javaspringmongo.devopsnetwork.net"] 
    }
    rule {
      host = "javaspringmongo.devopsnetwork.net"  
      http {
        path {
          path = "/"
          backend {
            service {
              name = "springapp-mongo-spring-mongo" 
              port {
                number = 80 
              }
            }
          }
        }
      }
    }
  }
}

/*resource "kubernetes_ingress_v1" "springapp-ingress" {
  wait_for_load_balancer = true
  metadata {
    name = "springapp-ingress"
    namespace = "springapp"
    annotations = {
        "alb.ingress.kubernetes.io/load-balancer-name" = "springapp"
        "alb.ingress.kubernetes.io/scheme"             = "internet-facing"
        "alb.ingress.kubernetes.io/target-type"        = "ip"                                       
        "alb.ingress.kubernetes.io/certificate-arn" = ""
  }
  }
  spec {
    ingress_class_name = "alb"
    default_backend {
      service {
        name = "springapp-spring-mongo" #springapp-mongo-spring-mongo
        port {
          number = 80
        }
      }
    }
    rule {
      host = "javaspringmongo.devopsnetwork.net"  
      http {
        path {
          path = "/"
          path_type = "Exact"
          backend {
            service {
              name = "springapp-spring-mongo" #springapp
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}*/
