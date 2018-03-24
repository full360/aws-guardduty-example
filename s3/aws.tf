# master
provider aws {
  region              = "us-east-1"
  version             = "~> 1.9"
  allowed_account_ids = ["${var.master_account_id}"]
}
