# ---------------------------------------------------------------------------
# variables.tf — inputs (all have sane defaults, so no tfvars file needed)
# ---------------------------------------------------------------------------

variable "resource_group_name" {
  type        = string
  description = "Resource group the governance initiative is assigned to."
  default     = "rg-mapletech-lab"
}

variable "location" {
  type        = string
  description = "The single permitted Azure region for this lab."
  default     = "canadacentral"
}
