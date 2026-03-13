terraform {
  required_version = ">= 1.8, < 2.0"
  required_providers {
    fabric = {
      source  = "microsoft/fabric"
      version = "1.8.0"
    }
  }
}

# SPN authentication for Fabric Provider
provider "fabric" {
    tenant_id     = var.tenant_id
    client_id     = var.client_id
    client_secret = var.client_secret
}

