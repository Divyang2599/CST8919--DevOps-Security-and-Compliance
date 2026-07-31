# ---------------------------------------------------------------------------
# assignment.tf
# ---------------------------------------------------------------------------

resource "azurerm_resource_group_policy_assignment" "mapletech" {
  name                 = "mapletech-secure-foundation"
  display_name         = "MapleTech Secure Foundation"
  resource_group_id    = azurerm_resource_group.lab.id
  policy_definition_id = azurerm_policy_set_definition.mapletech.id

  # enforce = true  -> Deny is ACTIVE (this is "Enforce" mode).
  # enforce = false -> audit-only (would log non-compliance but NOT block).
  enforce = true

  description = "Enforces MapleTech baseline governance on this resource group."
}
