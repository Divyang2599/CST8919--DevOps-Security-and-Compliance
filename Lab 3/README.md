# CST8919 - Lab 3: Cloud Governance with Azure Policy

**Course:** CST8919 - DevOps Security and Compliance  
**Student:** Divyang Lodariya  
**Video demo:** [PASTE YOUR VIDEO LINK HERE]  

---

## What this lab is about

The scenario is that I joined a company called MapleTech Solutions as a Cloud
Security Engineer. The problem was that developers were deploying resources
anywhere they wanted, making public IPs, and not adding tags. My job was to
stop that using **Azure Policy** so that bad deployments get blocked
automatically instead of me having to check everything by hand.

I did the whole thing with **Terraform** (infrastructure as code) instead of
clicking around in the portal, so it can be rebuilt anytime with one command.

## The three policies I made

| Policy | What it does |
|--------|--------------|
| **Only-CanadaCentral** | Blocks any resource that is not in the Canada Central region. |
| **Require-ProjectName-Tag** | Blocks any resource that doesn't have a `ProjectName` tag. |
| **Deny-Public-IP** | Blocks anyone from creating a Public IP address. |

All three use the **Deny** effect, which means the deployment is stopped before
anything gets created.

Then I put all three policies into one **initiative** (a group of policies)
called **MapleTech Secure Foundation**, and assigned that initiative to my
resource group `rg-mapletech-lab` in **Enforce** mode.

## Files in this folder

```
main.tf                  -> provider setup + the resource group
variables.tf             -> input values (region, resource group name)
policies.tf              -> the 3 custom policy definitions
initiative.tf            -> groups the 3 policies into one initiative
assignment.tf            -> assigns the initiative to the resource group
outputs.tf               -> prints useful IDs after apply
policy-definitions/      -> the 3 policy rules as JSON files
test-cases/run-tests.ps1 -> the commands I used to test the policies
screenshots/             -> my screenshots for each part
```

## How to run it

```powershell
# 1. Log in to Azure
az login
$env:ARM_SUBSCRIPTION_ID = (az account show --query id -o tsv)

# 2. Deploy the policies
terraform init
terraform apply

# 3. Wait about 5-10 minutes for the policy to become active, then test
#    (see test-cases/run-tests.ps1)

# 4. Clean up when done
terraform destroy
```

## Testing (Part 4)

I tested by trying to deploy things that break the rules, and one thing that
follows all the rules. Here is what happened:

| Test | What I tried | Result | Which policy blocked it |
|------|--------------|--------|-------------------------|
| 1 | Storage account in **East US** (tagged) | Blocked | Only-CanadaCentral |
| 2 | Storage account with **no tag** | Blocked | Require-ProjectName-Tag |
| 3 | A **Public IP** | Blocked | Deny-Public-IP |
| 4 | Storage account in **Canada Central + tag** | Allowed | none (it followed all rules) |

For each blocked test, Azure gave the error `RequestDisallowedByPolicy` and told
me exactly which policy blocked it. Test 4 worked fine because it followed every
rule. Screenshots of all of these are in the `screenshots/` folder.

## Challenges and what I learned

- **Permissions matter.** My first `terraform apply` failed with a 403 error
  because the account I was using didn't have permission to create policies.
  A normal Contributor role can deploy resources but cannot create policies.
  This is called separation of duties — it stops developers from changing the
  rules that are supposed to control them. I had to give my account the right
  role first.

- **Policies take a few minutes to turn on.** Right after assigning the
  initiative, my first test almost went through. I learned you have to wait a
  bit for the policy to actually start enforcing.

- **The "global" location trap.** For the region policy I had to also allow
  `global`, because some resources report their location as "global" and would
  get blocked by mistake otherwise.

- **VMs make a public IP by default.** If I had tested with a full VM, it would
  have been blocked by my public IP policy even in the correct region. So I
  tested with single resources (storage accounts and a public IP) so each test
  only breaks one rule at a time. That made it clear which policy did what.

- **"Enforcement mode: Default" is confusing wording.** In the portal, "Default"
  actually means enforcement is ON. "DoNotEnforce" is the audit-only one.

## Summary

Azure Policy let me set rules that get enforced automatically. Bad deployments
are stopped before they even happen, and good ones go through with no problem.
Doing it in Terraform means the whole setup is saved as code and can be built
again anytime.
