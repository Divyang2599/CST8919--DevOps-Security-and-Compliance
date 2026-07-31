# ===========================================================================
# run-tests.ps1  -  Part 4: simulate developer activity and prove enforcement
#
# WHY az CLI instead of Terraform for the TESTS:
#   A denied deployment is a HARD FAILURE. With Terraform that leaves partial
#   state / tainted resources you then have to clean up. az CLI gives an
#   instant, clean "RequestDisallowedByPolicy" error with the exact policy
#   name and NO state to unwind. Infra-as-code for the guardrails, ad-hoc CLI
#   to validate them - that's the real practitioner workflow.
#
# HOW TO USE:
#   1. Run `terraform apply` first (creates + assigns the initiative).
#   2. WAIT 5-10 MINUTES. Policy assignments take time to propagate; if you
#      test too fast a deployment can slip through before enforcement is live.
#   3. Run the tests below ONE AT A TIME so you can screenshot each result.
#      (Copy-paste each block; don't run the whole file blindly.)
#
# WHY single-resource tests (storage account, public IP) instead of a full VM:
#   A VM creates a NIC, disk, VNet, and (by default) a public IP all at once.
#   That makes it ambiguous WHICH policy denied it. Single resources isolate
#   the variable so each denial cleanly names exactly ONE policy - a far
#   stronger demo for the video and the grader.
# ===========================================================================

$RG = "rg-mapletech-lab"

# ---------------------------------------------------------------------------
# TEST 1 - Region violation.  EXPECT: DENIED by Only-CanadaCentral
# Storage account in East US, correctly tagged, so REGION is the only trigger.
# ---------------------------------------------------------------------------
az storage account create `
  --resource-group $RG `
  --name "testregion$(Get-Random -Maximum 99999)" `
  --location eastus `
  --sku Standard_LRS `
  --tags ProjectName=MapleTech

# ---------------------------------------------------------------------------
# TEST 2 - Missing tag.  EXPECT: DENIED by Require-ProjectName-Tag
# Correct region, no ProjectName tag, so the TAG is the only trigger.
# ---------------------------------------------------------------------------
az storage account create `
  --resource-group $RG `
  --name "testnotag$(Get-Random -Maximum 99999)" `
  --location canadacentral `
  --sku Standard_LRS

# ---------------------------------------------------------------------------
# TEST 3 - Public IP.  EXPECT: DENIED by Deny-Public-IP
# Correct region and tag, so the PUBLIC IP type is the only trigger.
# ---------------------------------------------------------------------------
az network public-ip create `
  --resource-group $RG `
  --name "test-public-ip" `
  --location canadacentral `
  --tags ProjectName=MapleTech

# ---------------------------------------------------------------------------
# TEST 4 - Fully compliant.  EXPECT: ALLOWED (succeeds)
# Correct region + correct tag + not a public IP = passes all three policies.
# ---------------------------------------------------------------------------
$compliantName = "testok$(Get-Random -Maximum 99999)"
az storage account create `
  --resource-group $RG `
  --name $compliantName `
  --location canadacentral `
  --sku Standard_LRS `
  --tags ProjectName=MapleTech

# Cleanup the one resource that actually got created (TEST 4):
# az storage account delete --resource-group $RG --name $compliantName --yes


# ===========================================================================
# OPTIONAL - literal VM tests to match the lab's wording exactly.
# Heads-up: `az vm create` auto-creates a public IP, which your Deny-Public-IP
# policy will block. Use --public-ip-address "" so the ALLOWED case isn't
# denied for the wrong reason. Sub-resource tagging on VMs can still be fussy;
# the storage-account tests above are the clean, reliable demo.
# ===========================================================================

# VM in East US  -> EXPECT: DENIED (region)
# az vm create --resource-group $RG --name vm-eastus --location eastus `
#   --image Ubuntu2204 --admin-username azureuser --generate-ssh-keys `
#   --public-ip-address "" --tags ProjectName=MapleTech

# VM in Canada Central, tagged, no public IP -> EXPECT: ALLOWED
# az vm create --resource-group $RG --name vm-cc --location canadacentral `
#   --image Ubuntu2204 --admin-username azureuser --generate-ssh-keys `
#   --public-ip-address "" --tags ProjectName=MapleTech
