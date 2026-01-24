module "test_rg" {
  source   = "../../modules/resource-group"
  name     = "pkr-test-rg-${var.build_id}"
  location = var.location
}

