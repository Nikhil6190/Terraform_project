#Enable AWS Organization
resource "aws_organizations_organization" "org" {
  feature_set = "ALL"
}
#Create Organization units

resource "aws_organizations_organizational_unit" "network" {
  name      = "network"
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "shared_services" {
  name      = "shared_services"
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "prod" {
  name      = "prod"
  parent_id = aws_organizations_organization.org.roots[0].id
}
resource "aws_organizations_organizational_unit" "non_prod" {
  name      = "non_prod"
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_account" "network" {
  name                       = "network-Account"
  email                      = var.org_emails["network"]
  parent_id                  = aws_organizations_organizational_unit.network.id
  iam_user_access_to_billing = var.allow_billing_access
}
resource "aws_organizations_account" "shared_services" {
  name                       = "shared_services-Account"
  email                      = var.org_emails["shared_services"]
  parent_id                  = aws_organizations_organizational_unit.shared_services.id
  iam_user_access_to_billing = var.allow_billing_access
}
resource "aws_organizations_account" "prod" {
  name                       = "prod-Account"
  email                      = var.org_emails["prod"]
  parent_id                  = aws_organizations_organizational_unit.prod.id
  iam_user_access_to_billing = var.allow_billing_access
}
resource "aws_organizations_account" "non_prod" {
  name                       = "non_prod"
  email                      = var.org_emails["non_prod"]
  parent_id                  = aws_organizations_organizational_unit.non_prod.id
  iam_user_access_to_billing = var.allow_billing_access
}
data "aws_organizations_organization" "org" {}



