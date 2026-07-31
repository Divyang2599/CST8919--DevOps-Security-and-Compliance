# ---------------------------------------------------------------------------
# outputs.tf 
# ---------------------------------------------------------------------------

output "resource_group_name" {
  description = "The governed resource group."
  value       = azurerm_resource_group.lab.name
}

output "initiative_id" {
  description = "Resource ID of the MapleTech Secure Foundation initiative."
  value       = azurerm_policy_set_definition.mapletech.id
}

output "assignment_id" {
  description = "Resource ID of the initiative assignment."
  value       = azurerm_resource_group_policy_assignment.mapletech.id
}
