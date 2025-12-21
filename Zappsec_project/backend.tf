terraform {
  backend "s3" {
    bucket  = "terraform-s3-bucket-for-project"
    key     = "control-tower/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}