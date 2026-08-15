# CST8919 — Cloud Security Services Comparison
## Azure vs AWS vs GCP: Security, Compliance & DevSecOps

> **Course:** CST8919 — DevOps: Security and Compliance | **Program:** Cloud Development & Operations | **College:** Algonquin College, Ottawa

---

## Table of Contents

1. [About This Report](#about-this-report)
2. [Quick Reference: All Services at a Glance](#quick-reference-all-services-at-a-glance)
3. [Service 1 — Identity & Access Management (IAM / SSO)](#service-1--identity--access-management-iam--sso)
4. [Service 2 — Monitoring & Log Analytics](#service-2--monitoring--log-analytics)
5. [Service 3 — Policy & Compliance Enforcement](#service-3--policy--compliance-enforcement)
6. [Service 4 — Cloud Security Posture Management (CNAPP)](#service-4--cloud-security-posture-management-cnapp)
7. [Service 5 — SIEM & SOAR (Threat Detection & Automated Response)](#service-5--siem--soar-threat-detection--automated-response)
8. [Summary & Key Takeaways](#summary--key-takeaways)
9. [References](#references)

---

## About This Report

In CST8919, we studied how to use Microsoft Azure to build secure, compliant cloud environments. This report takes everything we learned and answers one key question:

> **"If a company uses AWS or Google Cloud instead of Azure, which services do the same job?"**

This is a real skill in the cloud industry. Employers often use more than one cloud provider, and cloud engineers are expected to understand how tools map across platforms.

For each Azure service we studied, this report:
- Identifies the equivalent AWS and GCP service
- Compares their features, security certifications, pricing, and DevSecOps integration
- Explains the key differences in plain language

---

## Quick Reference: All Services at a Glance

| What It Does | Azure Service | AWS Equivalent | GCP Equivalent |
|---|---|---|---|
| **Identity, Authentication & SSO** | Microsoft Entra ID (Azure AD) | AWS IAM + IAM Identity Center | Cloud IAM + Cloud Identity |
| **Monitoring & Log Analytics** | Azure Monitor + Log Analytics | Amazon CloudWatch + CloudTrail | Cloud Monitoring + Cloud Logging |
| **Policy & Governance Enforcement** | Azure Policy | AWS Config + Service Control Policies (SCPs) | Organization Policy Service |
| **Cloud Security Posture + Workload Protection** | Microsoft Defender for Cloud | AWS Security Hub + GuardDuty + Inspector | Security Command Center (SCC) |
| **SIEM & SOAR (Threat Detection & Auto-Response)** | Microsoft Sentinel | Amazon Security Lake + Detective + EventBridge | Google Chronicle + Security Operations |

---

## Service 1 — Identity & Access Management (IAM / SSO)

### What This Service Does (In Simple Terms)

Think of IAM as the **front door security system** of your cloud. It controls:
- **Who** can get in (Authentication — AuthN)
- **What** they can do once inside (Authorization — AuthZ)
- **How** they prove who they are (MFA, SSO, Conditional Access)

In CST8919, we used **Microsoft Entra ID** to manage user identities, enable Single Sign-On (SSO), enforce Multi-Factor Authentication (MFA), and apply Role-Based Access Control (RBAC).

---

### Overview of Each Platform's Service

| | **Microsoft Entra ID** (Azure) | **AWS IAM + IAM Identity Center** | **Cloud IAM + Cloud Identity** (GCP) |
|---|---|---|---|
| **Full Name** | Microsoft Entra ID (formerly Azure Active Directory) | AWS Identity and Access Management + AWS IAM Identity Center | Google Cloud IAM + Google Cloud Identity |
| **What It Is** | Azure's central identity platform — manages users, groups, SSO, MFA, and Conditional Access | AWS IAM handles API-level permissions; IAM Identity Center adds SSO for human users across AWS accounts | Cloud IAM controls who can do what on GCP resources; Cloud Identity adds SSO, directory management, and MFA |
| **Best Described As** | A full enterprise identity directory + SSO platform | Two separate tools that together cover IAM + SSO | Two separate tools that together cover IAM + identity management |

---

### Core Features Comparison

| Feature | Azure Entra ID | AWS IAM + Identity Center | GCP Cloud IAM + Cloud Identity |
|---|---|---|---|
| **Single Sign-On (SSO)** | ✅ Built-in, supports thousands of apps via SAML, OIDC, OAuth | ✅ IAM Identity Center supports SSO to AWS accounts and business apps | ✅ Cloud Identity supports SSO via SAML 2.0 and OIDC |
| **Multi-Factor Authentication** | ✅ Built-in MFA with Authenticator app, SMS, FIDO2 hardware keys | ✅ MFA supported via virtual MFA, hardware keys, FIDO2 | ✅ MFA via Google Authenticator, hardware security keys (Titan) |
| **Role-Based Access Control (RBAC)** | ✅ Granular RBAC with built-in and custom roles at subscription, resource group, or resource level | ✅ IAM Policies control fine-grained permissions at account and resource level | ✅ Predefined and custom roles at organization, project, folder, or resource level |
| **Conditional Access** | ✅ Yes — blocks or grants access based on location, device compliance, sign-in risk | ⚠️ Partial — AWS IAM Conditions allow IP/time-based conditions, but not as rich as Entra ID | ⚠️ Partial — Context-Aware Access in BeyondCorp provides similar functionality |
| **Federated Identity (FIM)** | ✅ Full support via SAML, OIDC, WS-Federation with enterprise partners | ✅ SAML-based federation with external IdPs | ✅ SAML 2.0 federation with external identity providers |
| **User Directory** | ✅ Full Active Directory in the cloud — users, groups, organizational units | ⚠️ AWS IAM is not a directory; AWS Directory Service (extra cost) is needed for full AD replacement | ✅ Cloud Identity provides a full managed directory service |
| **Privileged Identity Management** | ✅ Just-in-time admin access with approval workflows | ✅ AWS IAM Access Analyzer + temporary credentials via STS | ⚠️ Limited native PIM — often supplemented with third-party tools |

---

### Security & Compliance

| | Azure Entra ID | AWS IAM + Identity Center | GCP Cloud IAM + Cloud Identity |
|---|---|---|---|
| **Compliance Certifications** | ISO 27001, SOC 1/2/3, GDPR, HIPAA, FedRAMP, PCI-DSS | ISO 27001, SOC 1/2/3, GDPR, HIPAA, FedRAMP, PCI-DSS | ISO 27001, SOC 1/2/3, GDPR, HIPAA, FedRAMP, PCI-DSS |
| **Zero Trust Support** | ✅ Native Zero Trust model built into Conditional Access | ✅ Supports Zero Trust via IAM Policies + AWS Verified Access | ✅ BeyondCorp Enterprise is Google's full Zero Trust platform |
| **Token Standards** | SAML 2.0, OAuth 2.0, OIDC, JWT, WS-Federation | SAML 2.0, OAuth 2.0, OIDC, AWS STS tokens | SAML 2.0, OAuth 2.0, OIDC |
| **Sign-In Risk Detection** | ✅ Built-in Identity Protection detects impossible travel, leaked credentials | ⚠️ Amazon GuardDuty handles threat detection (separate service) | ⚠️ Cloud Identity does not have native risk scoring — Chronicle handles this |
| **Audit Logging** | ✅ Sign-in logs, Audit logs, all integrated in Entra ID | ✅ AWS CloudTrail logs all IAM API calls | ✅ Cloud Audit Logs captures all identity and access events |

---

### Pricing Model

| | Azure Entra ID | AWS IAM + Identity Center | GCP Cloud IAM + Cloud Identity |
|---|---|---|---|
| **Free Tier** | ✅ Free tier includes basic SSO, MFA, and user management | ✅ AWS IAM is completely free; IAM Identity Center is free | ✅ Cloud IAM is free; Cloud Identity Free tier with basic features |
| **Paid Tier** | Entra ID P1: ~$6 USD/user/month (Conditional Access, group-based SSO) | IAM Identity Center: Free; Cognito (for app auth): ~$0.0055/MAU | Cloud Identity Premium: ~$6 USD/user/month |
| | Entra ID P2: ~$9 USD/user/month (adds Identity Protection, PIM) | AWS Directory Service: ~$0.05/hour per domain controller | |
| **Key Cost Driver** | Number of premium users needing Conditional Access or PIM | Number of Monthly Active Users (MAUs) in Cognito for app-level auth | Number of users on Cloud Identity Premium |

---

### Integration for DevSecOps

| | Azure Entra ID | AWS IAM + Identity Center | GCP Cloud IAM + Cloud Identity |
|---|---|---|---|
| **CI/CD Integration** | ✅ Azure DevOps, GitHub Actions via service principals and managed identities | ✅ GitHub Actions via OIDC federation, Jenkins via IAM roles | ✅ Cloud Build, GitHub Actions via Workload Identity Federation |
| **Terraform / IaC** | ✅ Terraform `azuread` provider for managing users, groups, and roles as code | ✅ Terraform `aws` provider for IAM policies, roles, users | ✅ Terraform `google` provider for Cloud IAM bindings |
| **Managed Identities** | ✅ System and user-assigned managed identities — no credentials in code | ✅ IAM Roles for EC2/Lambda — similar concept, no stored credentials | ✅ Service Accounts — equivalent to managed identities |
| **API Access** | Microsoft Graph API | AWS IAM API + AWS SDK | Cloud Identity API + Google Admin SDK |

---

### Key Differences (Plain Language Summary)

- **Azure Entra ID** is the most feature-rich and easiest to use for enterprise SSO, especially if the company already uses Microsoft 365 (Outlook, Teams, SharePoint). Conditional Access is particularly powerful and tightly integrated.
- **AWS IAM** is extremely granular and powerful for API-level permissions but is not designed as a user directory. SSO is handled by the separate IAM Identity Center service. AWS is best when you need extremely fine-grained control over service-to-service permissions.
- **GCP Cloud IAM** uses a clean hierarchy model (Organization → Folder → Project → Resource) and integrates naturally with Google Workspace. BeyondCorp is Google's standout feature for Zero Trust access.

---

## Service 2 — Monitoring & Log Analytics

### What This Service Does (In Simple Terms)

Think of cloud monitoring as the **security camera system + alarm system** for your cloud. It:
- Collects logs from every service (who did what, when)
- Monitors performance (is the server slow? Is CPU at 100%?)
- Sends alerts when something looks wrong
- Lets you search through millions of log entries quickly using query languages

In CST8919, we used **Azure Monitor** to collect logs, **Log Analytics** to run KQL queries against those logs, and **Activity Logs** to track admin actions.

---

### Overview of Each Platform's Service

| | **Azure Monitor + Log Analytics** | **Amazon CloudWatch + CloudTrail** | **Cloud Monitoring + Cloud Logging** (GCP) |
|---|---|---|---|
| **Full Name** | Azure Monitor (monitoring hub) + Log Analytics (query engine) | Amazon CloudWatch (monitoring + logs) + AWS CloudTrail (audit logs) | Google Cloud Monitoring + Google Cloud Logging (part of Cloud Operations Suite) |
| **What It Is** | Azure Monitor collects all telemetry (metrics, logs, traces); Log Analytics stores logs and lets you query them using KQL | CloudWatch monitors AWS services in real time; CloudTrail specifically logs every API call (who did what to which AWS resource) | Cloud Monitoring tracks performance metrics; Cloud Logging stores and queries all log data |
| **Unique Strength** | KQL (Kusto Query Language) is extremely powerful for threat hunting and custom analysis | CloudTrail provides a complete, tamper-evident audit trail of every AWS API call — excellent for compliance | Cloud Logging integrates natively with BigQuery for advanced analytics on very large log datasets |

---

### Core Features Comparison

| Feature | Azure Monitor + Log Analytics | Amazon CloudWatch + CloudTrail | GCP Cloud Monitoring + Cloud Logging |
|---|---|---|---|
| **Log Collection** | ✅ Collects from VMs, apps, containers, Azure services, custom sources | ✅ Collects from EC2, Lambda, RDS, all AWS services, and custom apps | ✅ Collects from GCE, Cloud Run, GKE, all GCP services, and custom apps |
| **Metrics (Numbers Over Time)** | ✅ Azure Monitor Metrics — CPU, memory, requests/second | ✅ CloudWatch Metrics — built-in for all AWS services | ✅ Cloud Monitoring — built-in metrics for all GCP services |
| **Log Storage & Search** | ✅ Log Analytics Workspace — long-term log storage with KQL search | ✅ CloudWatch Logs — searchable, but filter syntax is simpler than KQL | ✅ Cloud Logging — 30-day retention, exportable to Cloud Storage for long-term |
| **Query Language** | ✅ KQL (Kusto Query Language) — very powerful for threat analysis and correlation | ⚠️ CloudWatch Insights — SQL-like but less powerful than KQL | ⚠️ Logging Query Language (LQL) — simple filter-based, less powerful than KQL |
| **Dashboards & Visualization** | ✅ Azure Workbooks and dashboards, integration with Power BI and Grafana | ✅ CloudWatch Dashboards, integration with Grafana and Amazon QuickSight | ✅ Cloud Monitoring Dashboards, integration with Looker Studio and Grafana |
| **Alerting** | ✅ Alert rules based on metrics, log queries, and activity | ✅ CloudWatch Alarms trigger on any metric or log filter | ✅ Alerting policies on metrics or log-based metrics |
| **API Audit Trail** | ✅ Azure Activity Log captures all ARM (management-plane) API calls | ✅ AWS CloudTrail captures all AWS API calls — the gold standard for audit trails | ✅ Cloud Audit Logs capture Admin Activity, Data Access, and System Events separately |
| **Application Performance** | ✅ Application Insights for APM (application performance monitoring) | ✅ CloudWatch Application Insights + AWS X-Ray for tracing | ✅ Cloud Trace + Cloud Profiler for distributed tracing |

---

### Security & Compliance

| | Azure Monitor + Log Analytics | Amazon CloudWatch + CloudTrail | GCP Cloud Monitoring + Cloud Logging |
|---|---|---|---|
| **Compliance Certifications** | ISO 27001, SOC 1/2/3, GDPR, HIPAA, PCI-DSS, FedRAMP | ISO 27001, SOC 1/2/3, GDPR, HIPAA, PCI-DSS, FedRAMP | ISO 27001, SOC 1/2/3, GDPR, HIPAA, PCI-DSS, FedRAMP |
| **Log Integrity** | ✅ Log Analytics supports immutable storage and lock policies | ✅ CloudTrail supports S3 Object Lock for tamper-proof log storage | ✅ Cloud Logging supports Log Buckets with locked retention |
| **Long-Term Retention** | ✅ Up to 2 years in workspace; export to Storage Account for 7+ years | ✅ CloudWatch Logs: configurable retention; export to S3 for unlimited retention | ✅ 30-day default; export to Cloud Storage for long-term |
| **Encryption** | ✅ At rest and in transit; optional customer-managed keys | ✅ At rest (AWS KMS) and in transit; customer-managed keys | ✅ At rest and in transit; customer-managed encryption keys |

---

### Pricing Model

| | Azure Monitor + Log Analytics | Amazon CloudWatch + CloudTrail | GCP Cloud Monitoring + Cloud Logging |
|---|---|---|---|
| **Free Tier** | First 5 GB/month free; Activity Logs free | 10 custom metrics free; 5 GB CloudWatch Logs free | Free for system metrics; first 50 GB/month logging free |
| **Data Ingestion Cost** | ~$2.76 USD/GB after the free tier | ~$0.50 USD/GB for CloudWatch Logs after free tier | ~$0.01 USD/GB after 50 GB free |
| **Metrics Cost** | Free for Azure platform metrics | $0.30/metric/month for custom metrics | Free for built-in metrics; $0.18/metric/month for custom |
| **Key Cost Driver** | Volume of log data ingested into Log Analytics workspace | Volume of log data stored in CloudWatch Logs | Volume beyond the generous 50 GB free tier |
| **Best Value** | Good for Microsoft-heavy environments; bundled with many plans | Can get expensive at scale; careful log filtering recommended | Best value for large log volumes due to the 50 GB free tier |

---

### Integration for DevSecOps

| | Azure Monitor + Log Analytics | Amazon CloudWatch + CloudTrail | GCP Cloud Monitoring + Cloud Logging |
|---|---|---|---|
| **CI/CD Pipeline** | ✅ Azure DevOps integration, GitHub Actions, alerts on deployment failures | ✅ CloudWatch Events trigger CodePipeline stages and Lambda functions | ✅ Cloud Monitoring alerts integrate with Cloud Build and GitHub Actions |
| **Infrastructure as Code** | ✅ Terraform `azurerm_monitor_*` resources for alert rules and workspaces | ✅ Terraform `aws_cloudwatch_*` for alarms, log groups, and dashboards | ✅ Terraform `google_monitoring_*` for alerts and dashboards |
| **Custom Log Sources** | ✅ Log Analytics agent for on-premises servers and custom apps | ✅ CloudWatch Agent for EC2 and on-premises servers | ✅ Ops Agent for GCE VMs and on-premises servers |
| **Third-Party Integrations** | ✅ Grafana, Splunk, Datadog, Microsoft Defender, Sentinel | ✅ Grafana, Splunk, Datadog, New Relic, PagerDuty | ✅ Grafana, Splunk, Datadog, Looker Studio |
| **Auto-Remediation** | ✅ Alerts trigger Logic Apps for automated responses | ✅ CloudWatch Alarms trigger AWS Lambda for automated responses | ✅ Alerting triggers Cloud Functions for automated responses |

---

### Key Differences (Plain Language Summary)

- **Azure Monitor + Log Analytics** wins for security teams doing deep threat hunting — KQL is the most powerful query language of the three. The tight integration with Microsoft Sentinel makes it excellent for SIEM use cases.
- **AWS CloudWatch + CloudTrail** is considered the industry standard for API audit trails. CloudTrail's complete record of every AWS API call is widely trusted for compliance. However, the log query language is less powerful than KQL.
- **GCP Cloud Monitoring + Cloud Logging** offers the best free tier (50 GB/month) and the best BigQuery integration for very large-scale log analytics. Good choice for data-heavy environments.

---

## Service 3 — Policy & Compliance Enforcement

### What This Service Does (In Simple Terms)

Think of cloud policy as **automated building codes**. Just like a city's building code says "every building must have a fire exit," cloud policy says "every storage account must be encrypted" or "no resources can be deployed outside Canada Central."

The service automatically enforces these rules — it does not rely on developers remembering the rules. If someone tries to deploy something that violates a policy, they are blocked immediately.

In CST8919, we used **Azure Policy** to define rules (Policy Definitions), group them (Initiatives), apply them (Assignments), and verify compliance across our environments.

---

### Overview of Each Platform's Service

| | **Azure Policy** | **AWS Config + SCPs** | **GCP Organization Policy Service** |
|---|---|---|---|
| **Full Name** | Azure Policy | AWS Config + AWS Organizations Service Control Policies (SCPs) | Google Cloud Organization Policy Service |
| **What It Is** | A governance service that enforces rules on Azure resources. Rules written in JSON are applied to subscriptions or management groups. A resource that violates the rule is blocked, logged, or auto-remediated. | AWS Config records resource configurations and flags non-compliance. SCPs set permission guardrails at the AWS Organization level — they cannot grant permissions, only restrict them. Together they approximate Azure Policy. | Organization Policy constraints are applied at the organization, folder, or project level. They restrict what configurations are allowed — for example, preventing public IP addresses or limiting resource regions. |
| **Native to** | Azure | AWS Config is native; SCPs require AWS Organizations setup | GCP — built into the IAM hierarchy |

---

### Core Features Comparison

| Feature | Azure Policy | AWS Config + SCPs | GCP Organization Policy |
|---|---|---|---|
| **Rule Format** | JSON Policy Definitions | AWS Config Rules (JSON/Python) + SCPs (JSON IAM-like policies) | Constraints (pre-built or custom) applied via YAML/JSON |
| **Block Bad Configs at Creation** | ✅ Deny effect — blocks non-compliant resources before they exist | ⚠️ SCPs can deny IAM actions, but Config Rules only flag after creation | ✅ Resource Manager constraints block non-compliant deployments |
| **Group Rules Together** | ✅ Initiatives (Policy Sets) — bundle many definitions into one | ✅ AWS Config Conformance Packs — bundle many rules | ⚠️ Limited — constraints must be applied individually |
| **Auto-Fix Non-Compliant Resources** | ✅ DeployIfNotExists and Modify effects for auto-remediation | ✅ AWS Config Remediation Actions using SSM Automation | ⚠️ Limited auto-remediation — usually requires Cloud Functions |
| **Compliance Dashboard** | ✅ Built-in compliance reporting with percentage scores | ✅ AWS Config Dashboard with resource compliance status | ✅ Policy Compliance Dashboard in Security Command Center |
| **Built-In Rule Library** | ✅ 200+ built-in policies plus regulatory initiative packs | ✅ 100+ AWS managed Config rules | ✅ ~50+ pre-built constraints covering common security cases |
| **Regulatory Compliance Packs** | ✅ ISO 27001, NIST, CIS, PCI-DSS, Canadian PBMM — one-click initiatives | ✅ CIS Benchmarks, PCI-DSS, HIPAA conformance packs | ✅ CIS GCP Benchmarks, PCI-DSS, HIPAA constraints available |
| **Scope Inheritance** | ✅ Apply at Management Group → flows to all subscriptions below | ✅ SCPs apply at OU level → flow to all accounts below | ✅ Apply at Organization → flows to all Folders and Projects |

---

### Security & Compliance

| | Azure Policy | AWS Config + SCPs | GCP Organization Policy |
|---|---|---|---|
| **Compliance Frameworks Supported** | ISO 27001, NIST SP 800-53, CIS Benchmarks, PCI-DSS, HIPAA, GDPR, FedRAMP, Canadian PBMM | CIS Benchmarks, NIST, PCI-DSS, HIPAA, FedRAMP, SOC 2 | CIS GCP Benchmarks, NIST, PCI-DSS, HIPAA |
| **Data Residency Enforcement** | ✅ Block deployments outside allowed regions | ✅ SCPs can deny actions in specific regions | ✅ Constraints can restrict resource location |
| **Audit Evidence** | ✅ All compliance evaluations stored in Activity Logs | ✅ Config records every configuration change for compliance evidence | ✅ Cloud Audit Logs record all policy constraint violations |
| **Real-Time Enforcement** | ✅ Deny effect is real-time at deployment | ⚠️ Config Rules evaluate after deployment; SCPs are real-time | ✅ Constraints are enforced at resource creation time |

---

### Pricing Model

| | Azure Policy | AWS Config + SCPs | GCP Organization Policy |
|---|---|---|---|
| **Cost** | ✅ **Free** — Azure Policy itself has no charge | ⚠️ AWS Config: ~$0.003 per configuration item recorded; ~$0.001 per rule evaluation | ✅ **Free** — Organization Policy Service has no charge |
| **Additional Costs** | Remediation tasks use Azure compute/resources (normal charges apply) | Conformance packs: $0.001 per evaluation; S3 storage for Config history | Policy violations generate Cloud Audit Log entries (logging costs apply) |
| **Key Cost Driver** | None — the service is free | Volume of resources being tracked by Config and number of rule evaluations | Volume of audit log entries generated |
| **Cost Advantage** | Azure Policy is completely free — major advantage over AWS Config | Config costs can grow significantly in large environments with many resources | Organization Policy is free — matches Azure Policy |

---

### Integration for DevSecOps

| | Azure Policy | AWS Config + SCPs | GCP Organization Policy |
|---|---|---|---|
| **Terraform Integration** | ✅ `azurerm_policy_definition`, `azurerm_policy_assignment` — manage policies as code | ✅ `aws_config_rule`, `aws_organizations_policy` — manage Config and SCPs as code | ✅ `google_org_policy_policy` — manage constraints as code |
| **CI/CD Gating** | ✅ Terraform plan + `azurerm_policy` pre-checks; Azure Blueprints for pipeline templates | ✅ AWS CloudFormation Guard can check templates before deployment | ✅ Terraform pre-plan validation with `gcloud` CLI |
| **IaC Scanning** | ✅ Defender for Cloud DevSecOps scans Terraform/ARM before deployment | ✅ AWS CloudFormation Guard / cfn-lint for template validation | ✅ Forseti Security / Cloud Asset Inventory for scanning |
| **Remediation Automation** | ✅ Policy Remediation Tasks + Logic Apps for auto-fix | ✅ AWS Systems Manager Automation documents for auto-fix | ✅ Cloud Functions triggered by policy violations |

---

### Key Differences (Plain Language Summary)

- **Azure Policy** is the most straightforward and cost-effective governance tool. Rules are written in JSON, applied at any scope, and violations are blocked in real time at zero cost. The Initiatives feature makes grouping related rules easy. Best-in-class for enterprises.
- **AWS Config + SCPs** requires two separate services to achieve what Azure Policy does in one. Config evaluates compliance after deployment (reactive); SCPs set hard permission limits. Together they work, but the setup is more complex and Config is not free.
- **GCP Organization Policy** is clean and free like Azure Policy, and its integration with the GCP resource hierarchy (Organization → Folder → Project) is elegant. However, it has fewer built-in constraints than Azure Policy's extensive library.

---

## Service 4 — Cloud Security Posture Management (CNAPP)

### What This Service Does (In Simple Terms)

Think of this service as **a security advisor + real-time bodyguard** for your cloud. It does two things:
1. **Checks your setup** — scans your entire cloud environment for misconfigurations (the security equivalent of "your front door is unlocked")
2. **Watches your running systems** — detects active threats like malware, unusual processes, or data being stolen from your live servers

In CST8919, we used **Microsoft Defender for Cloud**, which has three components: **CSPM** (Cloud Security Posture Management — finds misconfigurations), **CWPP** (Cloud Workload Protection — real-time threat protection), and **DevSecOps** (scans code and IaC before deployment).

---

### Overview of Each Platform's Service

| | **Microsoft Defender for Cloud** (Azure) | **AWS Security Hub + GuardDuty + Inspector** | **Google Security Command Center (SCC)** |
|---|---|---|---|
| **Category** | CNAPP (Cloud-Native Application Protection Platform) | Collection of separate but integrated security services | CNAPP-equivalent unified security platform |
| **What It Is** | A unified security platform covering DevSecOps (code scanning), CSPM (posture management), and CWPP (workload protection) — all in one service | Security Hub aggregates findings from GuardDuty (threat detection), Inspector (vulnerability scanning), and other AWS services into one dashboard | A centralized security and risk management platform for GCP — identifies misconfigurations, threats, and vulnerabilities across your GCP organization |
| **Architecture** | One unified service with three pillars | Three separate services + Security Hub as the aggregation layer | One unified service (Standard + Premium tiers) |

---

### Core Features Comparison

| Feature | Microsoft Defender for Cloud | AWS Security Hub + GuardDuty + Inspector | GCP Security Command Center |
|---|---|---|---|
| **Posture Management (CSPM)** | ✅ Continuous scan of Azure resources for misconfigurations, with a Secure Score showing overall health | ✅ Security Hub aggregates findings from many sources; Security Score shows account health | ✅ SCC Standard continuously scans GCP resources for misconfigurations and policy violations |
| **Workload Protection (CWPP)** | ✅ Defender for Servers, Containers, Databases, Storage — real-time threat protection | ✅ Amazon GuardDuty — real-time threat detection for EC2, S3, IAM, Kubernetes | ✅ SCC Premium's Threat Intelligence detects active threats on GCP workloads |
| **Vulnerability Scanning** | ✅ Integrated vulnerability assessment for VMs and containers | ✅ Amazon Inspector — automated vulnerability scanning for EC2 and container images | ✅ SCC Web Security Scanner + Container Analysis for vulnerability detection |
| **DevSecOps (Code Scanning)** | ✅ Scans Terraform/ARM/Bicep templates in GitHub/Azure DevOps pipelines | ✅ AWS CodeGuru Security scans code in CodePipeline for security issues | ✅ Cloud Build integration with Container Analysis for container image scanning |
| **Multi-Cloud Support** | ✅ Covers Azure, AWS, and GCP in a single dashboard | ✅ Primarily AWS-native; limited partner integrations | ✅ GCP-native; limited external cloud support |
| **Secure Score / Health Score** | ✅ Secure Score (0–100%) with prioritized recommendations | ✅ Security Score in Security Hub | ✅ Security marks and findings score in SCC |
| **Alert Aggregation** | ✅ All findings in one Defender for Cloud dashboard | ✅ Security Hub as the central aggregation point | ✅ SCC as the central findings dashboard |
| **Compliance Standards** | ✅ CIS, PCI-DSS, NIST, ISO 27001, Canadian PBMM, Azure Security Benchmark | ✅ CIS AWS Foundations, PCI-DSS, NIST, FSBP | ✅ CIS GCP Benchmarks, PCI-DSS, NIST, ISO 27001 |

---

### Security & Compliance

| | Microsoft Defender for Cloud | AWS Security Hub + GuardDuty + Inspector | GCP Security Command Center |
|---|---|---|---|
| **Compliance Reporting** | ✅ Built-in regulatory compliance dashboard (ISO 27001, NIST, PCI-DSS, GDPR) | ✅ Security Hub compliance standards with automated checks | ✅ SCC compliance posture mapped to CIS, PCI-DSS, NIST |
| **Threat Intelligence Integration** | ✅ Microsoft Threat Intelligence — billions of signals from Microsoft's global network | ✅ GuardDuty uses CrowdStrike and Proofpoint threat intel feeds | ✅ Google Threat Intelligence and VirusTotal integration |
| **Data Protection Scanning** | ✅ Defender for Storage scans for sensitive data in blob storage | ✅ Amazon Macie detects sensitive data (PII) in S3 buckets | ✅ Cloud DLP (Data Loss Prevention) identifies sensitive data |
| **Zero Trust Alignment** | ✅ Integrates with Entra ID Conditional Access for Zero Trust enforcement | ✅ Integrates with AWS IAM for Zero Trust-aligned policies | ✅ Integrates with BeyondCorp for Zero Trust enforcement |

---

### Pricing Model

| | Microsoft Defender for Cloud | AWS Security Hub + GuardDuty + Inspector | GCP Security Command Center |
|---|---|---|---|
| **Free Tier** | ✅ Free basic CSPM with Secure Score and recommendations | ✅ Security Hub: 30-day free trial; GuardDuty: 30-day free trial | ✅ SCC Standard tier is free — includes basic posture management |
| **Paid CSPM** | Defender CSPM: ~$0.007/server/hour | Security Hub: ~$0.0010 per security finding/check per month | SCC Premium: Custom pricing (contact sales, typically enterprise) |
| **Paid CWPP (Servers)** | Defender for Servers Plan 1: ~$0.007/server/hour (~$5/server/month) | GuardDuty: ~$4 per 1 million CloudTrail events analysed | SCC Premium: Included in enterprise pricing |
| **Container Protection** | Defender for Containers: ~$0.011/core/hour | Inspector: ~$0.11/instance/month for container scanning | SCC: Included in Premium tier |
| **Key Cost Driver** | Number of protected servers, databases, and containers | Volume of events analysed by GuardDuty + number of findings in Security Hub | Size of organization and premium tier features needed |

---

### Integration for DevSecOps

| | Microsoft Defender for Cloud | AWS Security Hub + GuardDuty + Inspector | GCP Security Command Center |
|---|---|---|---|
| **GitHub Integration** | ✅ Native GitHub connector for code and IaC scanning | ✅ AWS CodeGuru integrates with GitHub via CodePipeline | ✅ Cloud Build integrates with GitHub for scanning |
| **IaC Security Scanning** | ✅ Scans Terraform, ARM, Bicep, CloudFormation templates in PR stage | ✅ AWS CloudFormation Guard + Checkov for IaC scanning | ✅ Terraform Validator + Forseti for IaC scanning |
| **Container Security** | ✅ Defender for Containers protects AKS, ACR, Docker Hub | ✅ Inspector scans ECR container images; GuardDuty protects EKS | ✅ Container Analysis scans Artifact Registry images |
| **Auto-Remediation** | ✅ Logic Apps playbooks triggered by Defender alerts | ✅ Security Hub + EventBridge + Lambda for automated remediation | ✅ SCC findings trigger Cloud Functions for automated response |
| **SIEM Integration** | ✅ Native integration with Microsoft Sentinel | ✅ Security Hub exports to Amazon Security Lake, Splunk, QRadar | ✅ SCC integrates with Google Chronicle and third-party SIEMs |

---

### Key Differences (Plain Language Summary)

- **Microsoft Defender for Cloud** is the most unified and easiest to set up. One service covers posture management, workload protection, and DevSecOps scanning. Its multi-cloud support (can also monitor AWS and GCP resources) is a significant advantage.
- **AWS Security Hub + GuardDuty + Inspector** requires three separate services to match Defender's capabilities. GuardDuty is considered best-in-class for threat detection in AWS environments, using machine learning on VPC Flow Logs and CloudTrail. The separate setup adds complexity.
- **GCP Security Command Center (SCC)** is Google's equivalent — clean and integrated for GCP. The Standard tier is free. The Premium tier adds threat intelligence but uses enterprise pricing (contact sales), making cost comparison harder for smaller organizations.

---

## Service 5 — SIEM & SOAR (Threat Detection & Automated Response)

### What This Service Does (In Simple Terms)

Think of a SIEM/SOAR as a **24/7 security operations center in software form**:
- **SIEM (Security Information and Event Management):** Collects logs from everywhere (firewalls, identity systems, servers, cloud services), uses AI to detect attack patterns that no single tool would see on its own, and raises alerts.
- **SOAR (Security Orchestration, Automated Response):** When a threat is detected, automatically runs a pre-built playbook — blocking an IP, isolating a server, creating a ticket, and alerting the team — without a human needing to be awake at 3 AM.

In CST8919, we used **Microsoft Sentinel** as our SIEM/SOAR. It ingests data via Data Connectors, uses KQL-based detection rules and AI (Fusion), and responds via Logic Apps Playbooks.

---

### Overview of Each Platform's Service

| | **Microsoft Sentinel** (Azure) | **AWS Security Lake + Detective + EventBridge** | **Google Chronicle + Security Operations** (GCP) |
|---|---|---|---|
| **Full Name** | Microsoft Sentinel | Amazon Security Lake + Amazon Detective + AWS EventBridge + Lambda (SOAR) | Google Chronicle SIEM + Google Security Operations (SOAR) |
| **Category** | Native cloud SIEM + SOAR in one service | No single native SIEM — Security Lake (data layer) + Detective (investigation) + EventBridge/Lambda (automation) approximate SIEM/SOAR functionality | Google Chronicle (SIEM) + Security Operations (SOAR) — acquired by Google, now GCP-native |
| **Architecture** | One unified service — data collection, detection, investigation, and automation all in one | Multiple AWS services must be combined — requires more setup and integration effort | Two services (Chronicle + Security Operations) that work closely together |
| **Best Described As** | The most complete cloud-native SIEM/SOAR available today | Functional but requires stitching together multiple AWS services | Google's strong answer — especially powerful for high-volume log analytics at speed |

---

### Core Features Comparison

| Feature | Microsoft Sentinel | AWS Security Lake + Detective + EventBridge | Google Chronicle + Security Operations |
|---|---|---|---|
| **Data Collection** | ✅ 100+ Data Connectors — Entra ID, Defender, Office 365, AWS, GCP, firewalls, antivirus, custom REST APIs | ✅ Security Lake aggregates from CloudTrail, VPC Flow Logs, Security Hub, Route 53, Lambda — based on OCSF standard | ✅ Chronicle ingests from Google services, third-party tools, and custom sources via APIs and connectors |
| **Threat Detection** | ✅ AI/ML Fusion detection, built-in analytics rules, Microsoft Threat Intelligence, custom KQL rules | ✅ GuardDuty + Security Hub findings + Amazon Detective for investigation; no dedicated ML correlation engine | ✅ Applied Threat Intelligence (Google/Mandiant), YARA-L detection rules, UDM schema for correlation |
| **Investigation** | ✅ Entity graph — visualizes how an attack spread across users, IPs, and resources | ✅ Amazon Detective — interactive relationship graphs for investigating GuardDuty findings | ✅ Chronicle investigation view — timeline of events linked to entities (users, IPs, assets) |
| **Automated Response (SOAR)** | ✅ Native Playbooks via Logic Apps — trigger on any alert, execute multi-step responses | ✅ EventBridge rules + Lambda functions for automation (requires custom code, no low-code interface) | ✅ Security Operations (Siemplify) — native SOAR with playbooks, case management, and automation |
| **Hunting (Proactive Search)** | ✅ Built-in hunting queries in KQL; Jupyter Notebooks for advanced analysis | ✅ Amazon Detective supports some graph-based hunting; CloudWatch Insights for log search | ✅ Chronicle's retroactive search — search across 1+ year of data in seconds |
| **Threat Intelligence Integration** | ✅ Microsoft Threat Intelligence, STIX/TAXII feeds, custom indicators | ✅ AWS integrates with third-party STIX/TAXII feeds via Security Hub | ✅ Google Threat Intelligence + Mandiant (world-class threat research) |
| **Case Management** | ✅ Sentinel Incidents — track alerts, assign to analysts, document investigation | ⚠️ No native case management — requires integration with Jira, ServiceNow, or PagerDuty | ✅ Chronicle Security Operations includes native case management and analyst workspace |
| **Multi-Cloud Detection** | ✅ Native connectors for AWS CloudTrail and GCP audit logs | ⚠️ Primarily AWS-native; third-party tools needed for Azure/GCP | ⚠️ Primarily GCP-native; third-party connectors for AWS/Azure |

---

### Security & Compliance

| | Microsoft Sentinel | AWS Security Lake + Detective + EventBridge | Google Chronicle + Security Operations |
|---|---|---|---|
| **Log Retention for Forensics** | ✅ Configurable retention; archive tier for long-term compliance storage | ✅ Security Lake on S3 — configurable retention, lifecycle policies for compliance | ✅ Chronicle retains 1 year of data by default — ideal for forensic investigations |
| **Compliance Certifications** | ISO 27001, SOC 1/2/3, GDPR, HIPAA, FedRAMP, PCI-DSS | ISO 27001, SOC 1/2/3, GDPR, HIPAA, FedRAMP, PCI-DSS | ISO 27001, SOC 1/2/3, GDPR, HIPAA, FedRAMP, PCI-DSS |
| **Data Sovereignty** | ✅ Data stays in the region you select; GDPR-compliant | ✅ Security Lake data stays in your selected AWS region | ✅ Chronicle data region selectable for GDPR compliance |
| **Audit of SIEM Activity** | ✅ All Sentinel operations logged in Azure Activity Logs | ✅ All AWS service actions logged in CloudTrail | ✅ All Chronicle operations logged in Cloud Audit Logs |

---

### Pricing Model

| | Microsoft Sentinel | AWS Security Lake + Detective + EventBridge | Google Chronicle + Security Operations |
|---|---|---|---|
| **Pricing Model** | Pay-per-GB of data ingested | Pay per service used (Security Lake S3 storage + query costs + Detective per-hour + Lambda invocations) | Usage-based per GB/day ingested into Chronicle |
| **Approximate Cost** | ~$2.46 USD/GB ingested (with 90-day Commitment Tier discounts available) | Variable — Security Lake: ~$0.023/GB stored; Detective: ~$1–$4/account/month; Lambda: very low | ~$0.10–$0.15 USD/GB/day (pricing typically enterprise-negotiated) |
| **Free Tier** | ✅ First 10 GB/day free during 31-day trial | ✅ Security Lake: 30-day free trial; Detective: 30-day free trial | ✅ Trial available; contact Google Sales for pricing |
| **Cost Predictability** | Good — one cost driver (GB ingested); Commitment Tiers reduce cost | Harder to predict — multiple services, each with separate billing | Moderate — Chronicle pricing is typically fixed contract-based |
| **Key Cost Driver** | Volume of log data ingested into the Sentinel workspace | Data volume in Security Lake + query frequency + Detective account count | Volume of log data ingested into Chronicle |
| **Cost Optimization** | Use workspace transformation rules to filter low-value logs before ingestion | Use Security Lake lifecycle policies to archive old data to cheaper S3 tiers | Chronicle's 1-year retention is included — no extra archival cost |

---

### Integration for DevSecOps

| | Microsoft Sentinel | AWS Security Lake + Detective + EventBridge | Google Chronicle + Security Operations |
|---|---|---|---|
| **CI/CD Integration** | ✅ Azure DevOps, GitHub Actions — deploy Sentinel analytics rules and Playbooks as code | ✅ CloudFormation / CDK for deploying EventBridge rules and Lambda functions | ✅ Terraform `google_chronicle_*` for managing rules; Cloud Build integration |
| **Infrastructure as Code** | ✅ Sentinel Analytics Rules and Playbooks deployable via ARM/Bicep/Terraform | ✅ EventBridge rules and Lambda functions managed via Terraform or CloudFormation | ✅ Chronicle rules can be managed as code via API |
| **Ticket System Integration** | ✅ Native Logic Apps connectors for ServiceNow, Jira, PagerDuty, Teams | ✅ Lambda + EventBridge can POST to ServiceNow, Jira, PagerDuty API | ✅ Security Operations has native integrations with ServiceNow, Jira, PagerDuty |
| **Incident Response Automation** | ✅ Logic Apps Playbooks — low-code, 400+ connectors, triggered by Sentinel alerts | ✅ EventBridge + Lambda — code-heavy, very flexible, but requires development | ✅ Security Operations SOAR Playbooks — low-code automation with GUI designer |
| **KQL / Query Language** | ✅ KQL used for detection rules, hunting, and investigation | ⚠️ CloudWatch Insights uses its own query syntax; Detective has a built-in graph UI | ✅ YARA-L (Chronicle-specific detection language) + SQL-like UDM search |

---

### Key Differences (Plain Language Summary)

- **Microsoft Sentinel** is the most complete cloud-native SIEM/SOAR available today. Its Logic Apps Playbooks are easy to build without coding, the Fusion AI catches complex multi-stage attacks, and KQL enables extremely powerful custom detections. For Microsoft-stack environments, it is the clear leader.
- **AWS** does not have a single native SIEM. Security Lake + Detective + EventBridge + Lambda together provide SIEM/SOAR capabilities, but require significantly more setup, custom code (Lambda), and integration work. For organizations that need more control and already have security engineers comfortable with AWS, this approach is very flexible but more complex.
- **Google Chronicle** is a formidable competitor — especially for speed and scale. Chronicle can search over a year of security data in seconds (Google's infrastructure advantage), and Mandiant's threat intelligence (owned by Google) is world-class. Security Operations (formerly Siemplify) is a strong SOAR. Best for organizations that prioritize forensic speed and threat intelligence quality.

---

## Summary & Key Takeaways

### Side-by-Side Comparison: Which Platform Wins Each Category?

| Category | Azure | AWS | GCP | Notes |
|---|---|---|---|---|
| **IAM & SSO ease of use** | ⭐ Best | Good | Good | Entra ID + Conditional Access is most feature-rich |
| **API Audit Trail quality** | Good | ⭐ Best | Good | CloudTrail is widely recognized as the gold standard |
| **Log query power (KQL vs others)** | ⭐ Best | Good | Good | KQL is more powerful than CloudWatch Insights or LQL |
| **Policy enforcement cost** | ⭐ Free | Paid | ⭐ Free | Azure Policy and GCP Org Policy are both free; AWS Config costs money |
| **CSPM (posture management)** | ⭐ Best | Good | Good | Defender for Cloud is the most unified; AWS requires multiple services |
| **Threat detection quality** | ⭐ Best | ⭐ Best | Good | GuardDuty and Sentinel are both excellent; Chronicle is growing |
| **SOAR (automated response)** | ⭐ Best | Good | Good | Logic Apps is easiest; Lambda requires coding; Security Operations is solid |
| **Multi-cloud visibility** | ⭐ Best | Limited | Limited | Defender for Cloud covers Azure, AWS, and GCP from one dashboard |
| **Free tier generosity** | Good | Good | ⭐ Best | GCP has the most generous free tiers across logging and security tools |
| **Pricing transparency** | Good | Good | ⚠️ Harder | Chronicle pricing is enterprise-negotiated; harder to estimate |

---

### Final Thoughts

There is no universally "best" cloud for security — the right choice depends on what a company already uses and what their team knows best.

- **Choose Azure** if the company uses Microsoft 365, has Windows-based systems, or wants the most integrated enterprise security stack with the least setup effort.
- **Choose AWS** if the company already runs significant workloads on AWS and needs deep, granular control over service-to-service permissions and compliance reporting at scale.
- **Choose GCP** if the company processes large volumes of data, works in data science or AI, or needs Google's exceptional log analytics performance and Mandiant-quality threat intelligence.

The biggest lesson from this comparison: **the concepts are the same across all three clouds.** Authentication, Authorization, Audit Logging, Policy Enforcement, Threat Detection, and Automated Response exist in every major cloud — just with different names and slightly different implementations. Understanding the concepts deeply (as studied in CST8919) makes it straightforward to learn any new platform's specific tools.

---

## References

- Microsoft Azure Documentation — [https://learn.microsoft.com/en-us/azure/](https://learn.microsoft.com/en-us/azure/)
- Microsoft Entra ID Documentation — [https://learn.microsoft.com/en-us/entra/identity/](https://learn.microsoft.com/en-us/entra/identity/)
- Microsoft Defender for Cloud — [https://learn.microsoft.com/en-us/azure/defender-for-cloud/](https://learn.microsoft.com/en-us/azure/defender-for-cloud/)
- Microsoft Sentinel Documentation — [https://learn.microsoft.com/en-us/azure/sentinel/](https://learn.microsoft.com/en-us/azure/sentinel/)
- Azure Policy Documentation — [https://learn.microsoft.com/en-us/azure/governance/policy/](https://learn.microsoft.com/en-us/azure/governance/policy/)
- AWS Identity and Access Management — [https://docs.aws.amazon.com/iam/](https://docs.aws.amazon.com/iam/)
- AWS Security Hub — [https://docs.aws.amazon.com/securityhub/](https://docs.aws.amazon.com/securityhub/)
- Amazon GuardDuty — [https://docs.aws.amazon.com/guardduty/](https://docs.aws.amazon.com/guardduty/)
- Amazon CloudWatch — [https://docs.aws.amazon.com/cloudwatch/](https://docs.aws.amazon.com/cloudwatch/)
- AWS Config — [https://docs.aws.amazon.com/config/](https://docs.aws.amazon.com/config/)
- Google Cloud IAM Documentation — [https://cloud.google.com/iam/docs](https://cloud.google.com/iam/docs)
- Google Security Command Center — [https://cloud.google.com/security-command-center/docs](https://cloud.google.com/security-command-center/docs)
- Google Chronicle — [https://cloud.google.com/chronicle/docs](https://cloud.google.com/chronicle/docs)
- Google Cloud Logging — [https://cloud.google.com/logging/docs](https://cloud.google.com/logging/docs)
- Google Organization Policy Service — [https://cloud.google.com/resource-manager/docs/organization-policy/overview](https://cloud.google.com/resource-manager/docs/organization-policy/overview)
- CST8919 Course Materials — Algonquin College, Ottawa (2025)

---

*Report prepared for CST8919 — DevOps: Security and Compliance | Algonquin College | Cloud Development & Operations Program*
