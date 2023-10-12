
module "kubernetes" {
  source = "../modules/k8s-cluster"

  k8s_clustername = "my-k8s-cluster"
  region          = "blr1"  # Replace with your desired region
  k8s_version     = "1.28.2-do.0"  # Replace with your desired Kubernetes version
  k8s_poolname    = "worker-pool"
  k8s_count       = 3
}



