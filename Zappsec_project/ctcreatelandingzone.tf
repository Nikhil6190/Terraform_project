data "terraform_remote_state" "landingzone" {
  backend = "s3"
  config = {
    bucket = "terraform-s3-bucket-for-project"
    key    = "control-tower/terraform.tfstate"
    region = "ap-south-1"
  }
}
resource "null_resource" "create_landing_zone" {
  provisioner "local-exec" {
    command = "aws controltower create-landing-zone --manifest file://${path.module}/landingzone.json --landing-zone-version ${var.landing_zone_version} --query 'operationIdentifier' --output text"
    environment = {
      AWS_REGION = var.region
    }
  }
}
