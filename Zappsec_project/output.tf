#ID of the entire AWS Organization
output "organization_id" {
  value       = aws_organizations_organization.org.id
  description = "The id of AWS Organization"
}
#Account IDs for Network Account
output "network_account_id" {
value = aws_organizations_account.network.id
}
#Account IDs for Share Services Account
output "shared_services_id" {
  value = aws_organizations_account.shared_services.id
}
#Account IDs for Prod Account
output "prod_id" {
  value = aws_organizations_account.prod.id
}
#Account IDs for Non-prod Account
output "non_prod_id" {
  value = aws_organizations_account.non_prod.id
}
output "management_account_id" {
  value = data.aws_organizations_organization.org.master_account_id
}