data "terraform_remote_state" "master" {
  backend = "s3"

  config {
    bucket = "proof-of-concept-gd-state"
    key    = "master/terraform.tfstate"
    region = "us-east-1"
  }
}
