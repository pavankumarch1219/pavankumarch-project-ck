resource "azuread_conditional_access_policy" "pkr_prod_policy" {
  display_name = "PKR-Prod-GitOps-Policy"

  conditions {
    users {
      included_roles = ["Global Administrator"]
    }
  }

  grant_controls {
    operator = "AND"
    built_in_controls = ["mfa"]
  }

  state = "enabled"
}

