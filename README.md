IaC-Driven Multi-Subscription AKS Microservices Deployment Pipeline
_________________________________________________________________________________________________________________________________________
Project Overview
Modern organizations require fast, reliable, and repeatable software delivery mechanisms. Manual deployments often lead to:
•	Configuration drift
•	Human errors
•	Slow deployments
•	Difficult rollbacks
This project implements a fully automated end-to-end DevOps pipeline that provisions infrastructure, configures servers, and deploys containerized microservices using modern DevOps practices.
Technologies Integrated
•	GitHub → Source Code & Webhook Trigger
•	Jenkins → CI/CD Pipeline Orchestration
•	Terraform → Infrastructure as Code
•	Ansible → Configuration Management
•	Azure → Cloud Infrastructure
•	AKS → Kubernetes Cluster
•	Helm → Microservices Deployment
_________________________________________________________________________________________________________________________________________
Problem Statement
Traditional deployment approaches involve manual provisioning, configuration, and deployment.
This leads to several problems:
Inconsistent Environments
Different engineers execute different commands causing configuration drift.
Human Errors
Manual processes increase the likelihood of mistakes and outages.
Slow Recovery
Rollback becomes difficult without automated deployments.
Poor Scalability
Manual processes cannot scale with modern infrastructure needs.
This project addresses these challenges using Infrastructure as Code and CI/CD automation.
_________________________________________________________________________________________________________________________________________
Project Objectives
•	Provision Azure infrastructure using Terraform
•	Deploy infrastructure across multiple Azure subscriptions
•	Configure servers using Ansible
•	Provision AKS clusters automatically
•	Deploy containerized microservices using Helm
•	Implement secure credential management in Jenkins
•	Enable subscription switching logic
•	Support apply/destroy lifecycle management
________________________________________________________________________________________________________________________________________


Repository Structure
DEVOPS
│
├── Ansible
│   ├── Inventory
│   │   └── inventory.ini
│   ├── Playbooks
│   │   ├── install-nginx.yml
│   │   ├── iis.yml
│   │   └── site.yml
│   └── ansible.cfg
│
├── Application
│
├── Terraform-Modules
│   │
│   ├── Subscription-A (Infra)
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── terraform.tfvars
│   │   └── winrm.ps1
│   │
│   └── Subscription-B (AKS)
│       ├── main.tf
│       ├── provider.tf
│       ├── variables.tf
│       └── terraform.tfvars
│
└── README.md
________________________________________
Infrastructure Provisioned
Azure Subscription A (VMS)
•	Linux Virtual Machine
•	Windows Virtual Machine
•	Bastion Host
•	Networking Resources

VM Configuration
Server	              Configuration
Linux VM	          Nginx installed using Ansible
Windows VM	          IIS installed using Ansible
________________________________________
Azure Subscription B (AKS)
•	Azure Kubernetes Service Cluster
•	Node Pools
•	Kubernetes Networking
________________________________________
CI/CD Pipeline Stages
1️⃣ Infrastructure Pipeline
Triggered when Terraform code changes.
Stages:
1.	Checkout Terraform Code
2.	Select Subscription
3.	Terraform Init
4.	Terraform Validate
5.	Terraform Plan
6.	Manual Approval
7.	Terraform Apply
________________________________________
2️⃣ CI Pipeline
Triggered when developers push code to GitHub.
Steps:
•	Build application
•	Package container
•	Prepare Kubernetes manifests / Helm charts
________________________________________
3️⃣ CD Pipeline
Deployment to AKS cluster.
Steps:
Login to Azure
Azure Subscription B (AKS)
az login --service-principal
Set Subscription
az account set --subscription <subscription-id>
Get AKS Credentials
az aks get-credentials --resource-group <rg> --name <aks-name>
Deploy Application
helm install robot-shop ./helm-chart
________________________________________
Test Stage
Validate application deployment:
kubectl get pods -n robot-shop
kubectl get svc -n robot-shop
________________________________________
Tools Used
Tool	Purpose
GitHub	        Version control
Jenkins	        CI/CD automation
Terraform	        Infrastructure provisioning
Ansible	        Server configuration
Azure	        Cloud platform
AKS	        Kubernetes cluster
Helm	        Microservices deployment
Kubernetes	        Container orchestration
________________________________________

Key Features
•	End-to-end DevOps automation
•	Infrastructure as Code
•	Multi-subscription Azure deployment
•	VM configuration using Ansible
•	Containerized microservices deployment
•	Automated CI/CD pipeline
•	Secure credential handling
________________________________________
Expected Results
•	Fully automated infrastructure deployment
•	Consistent environments
•	Faster release cycles
•	Reduced manual errors
•	Scalable DevOps architecture
________________________________________
Prerequisites
Ensure the following tools are installed:
•	Terraform
•	Ansible
•	Azure CLI
•	kubectl
•	Helm
•	Jenkins
•	Git

