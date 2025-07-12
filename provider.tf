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
        organization = "your_organization_name"
        workspaces {
            name = "your_workspace_name"
        }
      
    }
}
