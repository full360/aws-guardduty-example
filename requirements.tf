# required versions

provider "template" {
  version = "~> 1.0"
}

provider "aws" {
  version = "~> 1.11"
}

terraform {
  required_version = ">= 0.11.3"
}
