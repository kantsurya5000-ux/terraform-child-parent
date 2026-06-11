terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatestorage12345"
    container_name       = "tfstate"
    key                  = "test.terraform.tfstate"
  }
}
