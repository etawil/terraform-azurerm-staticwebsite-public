terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.46.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
    time = {
      source = "hashicorp/time"
      version = ">= 0.6.0"
    }
  }
  /*backend "azurerm" {
    resource_group_name = "ElieTawil"
    storage_account_name = "etterraformlab"
    container_name = "tfstatefiles"
    key = "terraform.tfstate" #name of terraform state file. Can be anyfilename.tfstate (prod.tfstate, uat.tfstate etc...)
  }*/
}
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  tenant_id = "151a3694-1e2f-4a7f-bf26-102adc3fcc10"
  subscription_id = "85388462-6237-4ded-80f9-d5a349509c51"
  client_id = "f8d7ae6e-7fa4-4f45-a80c-cd4759ca25a5"
  client_secret   = "Wds8Q~sRMg5bIqXZB0BcUSKsuv9ptgaxw-XXSa7t"
  #az login --service-principal -u "f8d7ae6e-7fa4-4f45-a80c-cd4759ca25a5" -p "Wds8Q~sRMg5bIqXZB0BcUSKsuv9ptgaxw-XXSa7t" --tenant "151a3694-1e2f-4a7f-bf26-102adc3fcc10"
}