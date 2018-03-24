terraform {
  backend "s3" {
    bucket = "proof-of-concept-gd-state"
    key    = "members/terraform.tfstate"
    region = "us-east-1"
  }
}
