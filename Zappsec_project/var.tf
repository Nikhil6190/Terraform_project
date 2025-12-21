variable "region" {
  description = "The AWS region"
  type        = string
  default     = "ap-south-1"
}
variable "org_emails" {
  description = "Map of account names to their unique root email addresses"
  type        = map(string)
}
variable "allow_billing_access" {
  description = "Allow IAM users in child accounts to access billing"
  type        = string
  default     = "ALLOW"
}
variable "landing_zone_version" {
  default = "4.0"
}
