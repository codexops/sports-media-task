# Terraform Kubernetes Cluster Deployment

## Overview
This Terraform project automates the provisioning of a DigitalOcean Kubernetes (DOKS) cluster and deploys essential components for your Kubernetes environment. It's structured as follows:

### Project Structure
- `modules/k8s-cluster`: Contains the Terraform module for creating a DigitalOcean Kubernetes cluster.
  - `main.tf`: Defines the DOKS cluster using `digitalocean_kubernetes_cluster` resource.
  - `variables.tf`: Defines input variables used in the module.
  - `outputs.tf`: Defines output values.
  - `provider.tf`: Specifies the required provider configuration.

- `terraform-k8s-cluster`: The main directory for your Terraform configuration.
  - `main.tf`: Utilizes the `k8s-cluster` module to provision the Kubernetes cluster.
  - `helm-release.tf`: Deploys Helm charts for cert-manager, nginx-ingress, and kube-prometheus.
  - `provider.tf`: Specifies provider configurations.
  - `variables.tf`: Defines input variables used in your main configuration.

- `k8s-deployment-files`: This directory holds Kubernetes YAML files for deploying your applications.

#### GitHub Actions Workflow (CI/CD Deployment)

This GitHub Actions workflow, defined in the `.github/workflows/ci-cd-deployment.yml` file, automates the build and deployment of your application Docker images to a container registry and deploys them to your Kubernetes cluster. The workflow is triggered on every push to the `main` branch.

This workflow automates the build, pushing of Docker images to a registry, and deploying your application to the Kubernetes cluster whenever there is a push to the main branch. Make sure to set up the necessary secrets for Docker and your Kubernetes configuration to enable this CI/CD process.


### Terraform Variables
You can customize the Terraform deployment by modifying the variables in the terraform-k8s-cluster/variables.tf file.

### Helm Chart Deployments
In addition to provisioning the Kubernetes cluster, this Terraform project deploys important Helm charts. These enhance your Kubernetes environment:

**cert_manager** : Deploys cert-manager in the cert-manager namespace for managing TLS certificates.

**nginx_ingress** : Deploys nginx-ingress in the nginx namespace for routing external traffic to services.

**kube_prometheus**: Deploys kube-prometheus-stack in the monitoring namespace for monitoring and alerting.

### Usage
To use this Terraform project, follow these steps:

1. Clone the repository.
   ```bash
   git clone https://github.com/your/repo.git
   cd repo/terraform-k8s-cluster
2. Initialize your Terraform workspace.
   ```bash 
   terraform init
3. Review and plan your infrastructure changes.
   ```bash
   terraform plan
4. Apply the infrastructure changes.
   ```bash
   terraform apply
After provisioning your Kubernetes cluster, you can deploy your applications using the YAML files located in the k8s-deployment-files directory. Be sure to update these YAML files as needed for your specific applications.


5. Deploy applications and Cert-Manager using kubectl
   ```bash
   cd ../k8s-deployment-files
   kubectl apply -f angular-deploy.yaml
   kubectl apply -f laravel-deploy.yaml
   kubectl apply -f cert-issuer.yaml
   kubectl apply -f ingress.yaml
