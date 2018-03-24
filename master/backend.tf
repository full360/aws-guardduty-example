terraform {
  backend "s3" {
    bucket = "proof-of-concept-gd-state"
    key    = "master/terraform.tfstate"
    region = "us-east-1"
  }
}
