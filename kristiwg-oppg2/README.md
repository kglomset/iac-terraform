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

When uploading the files to a repository to test workflows, you need to create three branches. Dev, staging and prod. 

You also need to create the environment production in your repository settings in github, and assign an assignee. Without that you will not have any manual approval before deploying to prod. 

You then need to connect to azure? Yes you def need to connect to azure.

To trigger a workflow simply edit something in the infrastructure and push it up to a desired branch, e.g main, or a feature branch. This will trigger the workflow that validates and reviews the infrastructure code. To deploy the infrastructure to the desired environment, create a pull request from the given branch to the environment of choice. A pull request and merge from feature branch to dev, will trigger the workflow that deploys dev. The same goes for the other environments.

You will also have to log in to your tenant using az login in the terminal in your vscode before pushing changes and creating pull requests. 