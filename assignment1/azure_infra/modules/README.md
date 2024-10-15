### How to use
To use this Terraform configuration, unzip the file and open it in Visual Studio Code. Open the command prompt and make sure you are located in the "./assignment1/azure_infra/" directory. The execute the following commands in the given order:

First, initialize terraform in the described directory:
`terraform init`

Second, create a main.tfplan file: 
`terraform plan -out=main.tfplan`

These command wil initialize terraform and make a blueprint of the resources for Azure to use to create them.

Third, apply the main.tfplan file:
`terraform apply main.tfplan`

To tear down resources use the following command and make sure to verify it by typing in yes when prompted:
`terraform destroy`


### Modules
#### keyVault
Holds the secrets to access the virtual machine scale set and the storage account access key.
To set username and password credentials for the virtual machine, edit the terraform.tfvars file and update password and username to the desired values. For passwords, lowercase, uppercase, numbers and special letters are recommended, and three of these are mandatory. 

#### network
Contains the resources for creatin a virtual network and two subnets that the virtual machine connects to. Also contains a network security group attatched to the virtual network

#### storageAccount
Contains the resources for the storage account and the storage container for this project

#### vm
Contains the resources for the virtual machine to be deployed on the Azure platform.

