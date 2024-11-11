# OperaTerra Azure Infrastructure for E-commerce platform


## Project Overview
This project uses Terraform to deploy and manage cloud infrastructure in Azure for OperaTerra's E-com platform. It provisions a virtual network with proper subnets, an Azure service plan for hosting the web application, an SQL database for storing product and user data, Azure blob storage for storing product images and a load balancer for distributing incoming traffic. 

## Modules
- app service
- database
- networking
- storage
- vmss
- global
- deployments

## Prerequisites
In order to deploy the application with remote state storage you need to change the backend backend block in the deployments main.tf:
```terraform
    backend "azurerm" {
    resource_group_name  = "<Your resource group name>"
    storage_account_name = "<Youre storageaccount name>>"
    container_name       = "<Your container name>"
    key                  = "opera-terra/web-app/nn-deployment/nn-deployment.tfstate"
  }
```
You also need to change the subscription_id in the provider block to your specific subscription id:
```terraform
    provider "azurerm" {
        subscription_id = "<Your subscription id>"
        features {}
   }   
```

### Branches
When uploading the files to a repository to test workflows, you need to create three branches: dev, staging and prod. These are required in order to have the pipeline working

### Environments
You also need to create the environment 'production' in your repository settings in github, and assign an assignee. Without that you will not have any manual approval before deploying to prod. The assignee will get an email, and the changes in prod will not be deployed until approved.

Also, you will need to set up environment variables in Github. These can be found in Settings -> Secrets and variables -> Actions. They need to have the following naming convention:
```
  ARM_CLIENT_ID
  ARM_CLIENT_SECRET
  ARM_SUBSCRIPTION_ID
  ARM_TENANT_ID
```

### Azure authentication
You will need to connect and authenticate your account to Azure, before pushing the files to a remote repository on Github. This can be done two ways, but option 1 is recommended:
##### Option 1:
Authenticate in VS Code using regular login
```bash
az login
```
A login display will then pop up and you can log in using username and password. 

##### Option 2
Authenticate in VS Code using a shell login
```bash
az login --service-principal --username < your-app-id > --password < your-password > --tenant < your-tenant-id >
```
## Workflow triggering
To trigger a workflow simply edit something in the infrastructure and push it up to a desired branch, e.g main, or a feature branch. This will trigger the workflow that validates and reviews the infrastructure code. To deploy the infrastructure to the desired environment, create a pull request from the given branch to the environment of choice. A pull request and merge from feature branch to dev, will trigger the workflow that deploys dev. The same goes for the other environments.