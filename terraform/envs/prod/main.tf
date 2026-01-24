module "prod_rg" {
  source   = "../../modules/resource-group"
  name     = "pkr-prod-rg"
  location = var.location
}

