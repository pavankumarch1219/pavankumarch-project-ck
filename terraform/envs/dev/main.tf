module "dev_rg" {
  source   = "../../modules/resource-group"
  name     = "pkr-dev-rg-${var.build_id}"
  location = var.location
}

