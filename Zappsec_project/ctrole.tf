# Control Tower Admin Role
resource "aws_iam_role" "awscontroltoweradmin_role" {
  name = "AWSControlTowerAdmin"
  path = "/service-role/"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "controltower.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "awscontroltoweradmin_managedpolicy" {
  role       = aws_iam_role.awscontroltoweradmin_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSControlTowerServiceRolePolicy"
}

# StackSet Execution Role
resource "aws_iam_role" "awscontroltowerstackset_role" {
  name = "AWSControlTowerStackSetRole"
  path = "/service-role/"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "cloudformation.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "awscontroltowerstackset_inline_policy" {
  name = "AWSControlTowerStackSetPolicy"
  role = aws_iam_role.awscontroltowerstackset_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "sts:AssumeRole",
          "cloudformation:CreateStackSet",
          "cloudformation:UpdateStackSet",
          "cloudformation:DeleteStackSet",
          "cloudformation:CreateStackInstances",
          "cloudformation:DeleteStackInstances"
        ],
        Resource = "*"
      }
    ]
  })
}

# Config Aggregator Role
resource "aws_iam_role" "awscontroltowerconfigaggregator_role" {
  name = "AWSControlTowerConfigAggregatorRole"
  path = "/service-role/"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "config.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "awscontroltowerconfigrole_managedpolicy" {
  role       = aws_iam_role.awscontroltowerconfigaggregator_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRoleForOrganizations"
}