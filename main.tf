# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100.0"
    }
  }

  # cloud {
  #   organization = "finches"
  #   workspaces {
  #     name = "learn-terraform-azure-stribble"
  #   }
  # }

  backend "azurerm" {
    resource_group_name  = "RG-SLOANE_TRIBBLE-bootcamp" # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "stribblestorage"            # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                    # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "prod.terraform.tfstate"     # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }

  required_version = ">= 1.2.0"
}

# configure specified provider
provider "azurerm" {
  features {}
} 

# resource "azurerm_resource_group" "rg" {
#   name     = var.resource_group_name
#   location = "westus"

#   tags = {
#     Environment = "Terraform Getting Started (Myles was here)"
#     Team = "DevOps"
#   }
# }

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "stribbleTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "westus"
  resource_group_name = var.resource_group_name
}