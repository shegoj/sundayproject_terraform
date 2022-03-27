terraform {
  backend "s3" {
    bucket = "techbleat-terraform-state"
    region = "eu-west-1"
  }
}