# ---------------------------------------------------------------------------
# policies.tf 
# ---------------------------------------------------------------------------

# Policy 1: Region Lockdown — deny anything not in Canada Central.
resource "azurerm_policy_definition" "only_canadacentral" {
  name         = "Only-CanadaCentral"
  policy_type  = "Custom"
  mode         = "Indexed" # Indexed = evaluate only resource types that carry a location/tags. Mirrors MS's built-in "Allowed locations".
  display_name = "Only-CanadaCentral"
  description  = "Denies any resource that is not deployed in the Canada Central region."

  metadata = jsonencode({
    category = "Security"
  })

  policy_rule = file("${path.module}/policy-definitions/only-canadacentral.json")
}

# Policy 2: Mandatory Tagging — deny resources missing the ProjectName tag.
resource "azurerm_policy_definition" "require_projectname_tag" {
  name         = "Require-ProjectName-Tag"
  policy_type  = "Custom"
  mode         = "Indexed" # Indexed also EXCLUDES resource groups, so RG creation isn't blocked on tags. Matches MS's "Require a tag on resources".
  display_name = "Require-ProjectName-Tag"
  description  = "Requires all resources to include a ProjectName tag."

  metadata = jsonencode({
    category = "Security"
  })

  policy_rule = file("${path.module}/policy-definitions/require-projectname-tag.json")
}

# Policy 3: Block Public IPs — deny creation of any Public IP address.
resource "azurerm_policy_definition" "deny_public_ip" {
  name         = "Deny-Public-IP"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "Deny-Public-IP"
  description  = "Prevents creation of Public IP addresses (reduces attack surface)."

  metadata = jsonencode({
    category = "Security"
  })

  policy_rule = file("${path.module}/policy-definitions/deny-public-ip.json")
}
