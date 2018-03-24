# static
variable "master_account_id" {
  default = "234567890123"
}

variable "region_list" {
  default = [
    "us-east-1",
    "us-east-2",
    "us-west-1",
    "us-west-2",
  ]

  type = "list"
}
