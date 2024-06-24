resource "kubernetes_secret_v1" "krillin-1 { #do not name krillin so it won't crash with the secret for mongodb
  metadata {
    name = "krillin-1"
    namespace = "springapp" 
  }

  data = {
    MONGO_DB_USERNAME = var.krillin
    MONGO_DB_PASSWORD = var.destructodisk
  }
