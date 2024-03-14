terraform {
  backend "azurerm" {
    storage_account_name = "tfstaten01495748sa"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstate"
    access_key           = ""
    }
}
