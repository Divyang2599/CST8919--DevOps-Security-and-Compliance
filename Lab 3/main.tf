# ---------------------------------------------------------------------------
# main.tf 
# ---------------------------------------------------------------------------

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      # v4 is the current provider line and what you'd use on the job.
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  # Auth is handled by the Azure CLI (`az login`) + the ARM_SUBSCRIPTION_ID
  # environment variable. See README for the two setup commands.
  # WHY no keys here: never hardcode credentials in .tf files — that is the
  # exact secret-in-repo mistake this whole course is teaching you to avoid.
}

# We look up the current subscription because custom policy DEFINITIONS are
# created here (subscription scope), while the ASSIGNMENT targets a single
# resource group. Rule of Azure Policy: a definition must live at or ABOVE
# the scope where it's assigned. Subscription > Resource Group, so this works.
data "azurerm_subscription" "current" {}

# The resource group that the initiative will be enforced on.
# We tag it so it is itself compliant with the ProjectName policy.
resource "azurerm_resource_group" "lab" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    ProjectName = "MapleTech"
  }
}
