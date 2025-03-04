# Terraform EKS Cluster with Prometheus, Grafana, and NGINX

This project sets up an Amazon EKS (Elastic Kubernetes Service) cluster using Terraform. It also deploys Prometheus and Grafana for monitoring and visualization, along with NGINX for log checking.

## Project Structure

```
terraform-eks-cluster
├── modules
│   ├── eks
│   ├── prometheus
│   ├── grafana
│   └── nginx
├── main.tf
├── outputs.tf
├── variables.tf
├── versions.tf
└── README.md
```

## Prerequisites

- Terraform installed on your local machine.
- AWS CLI configured with appropriate permissions.
- kubectl installed for interacting with the Kubernetes cluster.
- Helm installed for managing Kubernetes applications.

## Setup Instructions

1. **Clone the Repository**

   Clone this repository to your local machine:

   ```
   git clone <repository-url>
   cd terraform-eks-cluster
   ```

2. **Configure Variables**

   Update the `variables.tf` file with your desired configuration, including the AWS region, cluster name, and node instance types. By default, the configuration uses `t2.micro` instances, which are eligible for the AWS free tier.

3. **Initialize Terraform**

   Run the following command to initialize Terraform and download the necessary providers:

   ```
   terraform init
   ```

4. **Plan the Deployment**

   Generate an execution plan to see what resources will be created:

   ```
   terraform plan
   ```

5. **Apply the Configuration**

   Deploy the EKS cluster and associated resources:

   ```
   terraform apply
   ```

   Confirm the action when prompted.

6. **Access the EKS Cluster**

   After the deployment is complete, configure `kubectl` to use the new EKS cluster:

   ```
   aws eks --region <region> update-kubeconfig --name <cluster-name>
   ```

7. **Deploy Prometheus and Grafana**

   The Prometheus and Grafana modules will be automatically deployed as part of the Terraform configuration. You can access their services using the URLs provided in the outputs.

8. **Check NGINX Logs**

   NGINX will be deployed to help check logs. Access the NGINX service using the URL provided in the outputs.

## Outputs

After deployment, the following outputs will be available:

- EKS Cluster Name
- EKS Cluster Endpoint
- Prometheus Service URL
- Grafana Service URL
- NGINX Service URL

## Cleanup

To remove all resources created by this project, run:

```
terraform destroy
```

Confirm the action when prompted.
