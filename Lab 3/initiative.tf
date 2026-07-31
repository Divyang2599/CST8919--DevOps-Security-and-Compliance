# ---------------------------------------------------------------------------
# initiative.tf 
# ---------------------------------------------------------------------------

resource "azurerm_policy_set_definition" "mapletech" {
  name         = "MapleTech-Secure-Foundation"
  policy_type  = "Custom"
  display_name = "MapleTech Secure Foundation"
  description  = "Baseline governance guardrails: region, tagging, and no public IPs."

  metadata = jsonencode({
    category = "Security"
  })

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.only_canadacentral.id
    reference_id         = "Only-CanadaCentral"
  }

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.require_projectname_tag.id
    reference_id         = "Require-ProjectName-Tag"
  }

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.deny_public_ip.id
    reference_id         = "Deny-Public-IP"
  }
}
