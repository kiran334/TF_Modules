provider "azurerm" {
    features {}
  
}

terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 3.0"
        }
    }
    backend "remote" {
        organization = "kiran_545"
        workspaces {
            name = "TF-Git-Dev-wksp"
        }
      
    }
}
