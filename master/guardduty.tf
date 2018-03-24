resource "aws_guardduty_detector" "master-ap-south-1" {
  count    = "${data.aws_caller_identity.current.account_id == "${var.master_account_id}" && contains("${var.region_list}", "ap-south-1") ? 1 : 0}"
  enable   = true
  provider = "aws.master-ap-south-1"
}

resource "aws_guardduty_detector" "master-eu-west-3" {
  count    = "${data.aws_caller_identity.current.account_id == "${var.master_account_id}" && contains("${var.region_list}", "eu-west-3") ? 1 : 0}"
  enable   = true
  provider = "aws.master-eu-west-3"
}

resource "aws_guardduty_detector" "master-eu-west-2" {
  count    = "${data.aws_caller_identity.current.account_id == "${var.master_account_id}" && contains("${var.region_list}", "eu-west-2") ? 1 : 0}"
  enable   = true
  provider = "aws.master-eu-west-2"
}

resource "aws_guardduty_detector" "master-eu-west-1" {
  count    = "${data.aws_caller_identity.current.account_id == "${var.master_account_id}" && contains("${var.region_list}", "eu-west-1") ? 1 : 0}"
  enable   = true
  provider = "aws.master-eu-west-1"
}

resource "aws_guardduty_detector" "master-ap-northeast-2" {
  count    = "${data.aws_caller_identity.current.account_id == "${var.master_account_id}" && contains("${var.region_list}", "ap-northeast-2") ? 1 : 0}"
  enable   = true
  provider = "aws.master-ap-northeast-2"
}

resource "aws_guardduty_detector" "master-ap-northeast-1" {
  count    = "${data.aws_caller_identity.current.account_id == "${var.master_account_id}" && contains("${var.region_list}", "ap-northeast-1") ? 1 : 0}"
  enable   = true
  provider = "aws.master-ap-northeast-1"
}

resource "aws_guardduty_detector" "master-sa-east-1" {
  count    = "${data.aws_caller_identity.current.account_id == "${var.master_account_id}" && contains("${var.region_list}", "sa-east-1") ? 1 : 0}"
  enable   = true
  provider = "aws.master-sa-east-1"
}

resource "aws_guardduty_detector" "master-ca-central-1" {
  count    = "${data.aws_caller_identity.current.account_id == "${var.master_account_id}" && contains("${var.region_list}", "ca-central-1") ? 1 : 0}"
  enable   = true
  provider = "aws.master-ca-central-1"
}

resource "aws_guardduty_detector" "master-ap-southeast-1" {
  count    = "${data.aws_caller_identity.current.account_id == "${var.master_account_id}" && contains("${var.region_list}", "ap-southeast-1") ? 1 : 0}"
  enable   = true
  provider = "aws.master-ap-southeast-1"
}

resource "aws_guardduty_detector" "master-ap-southeast-2" {
  count    = "${data.aws_caller_identity.current.account_id == "${var.master_account_id}" && contains("${var.region_list}", "ap-southeast-2") ? 1 : 0}"
  enable   = true
  provider = "aws.master-ap-southeast-2"
}

resource "aws_guardduty_detector" "master-eu-central-1" {
  count    = "${data.aws_caller_identity.current.account_id == "${var.master_account_id}" && contains("${var.region_list}", "eu-central-1") ? 1 : 0}"
  enable   = true
  provider = "aws.master-eu-central-1"
}

resource "aws_guardduty_detector" "master-us-east-1" {
  count    = "${data.aws_caller_identity.current.account_id == "${var.master_account_id}" && contains("${var.region_list}", "us-east-1") ? 1 : 0}"
  enable   = true
  provider = "aws.master-us-east-1"
}

resource "aws_guardduty_detector" "master-us-east-2" {
  count    = "${data.aws_caller_identity.current.account_id == "${var.master_account_id}" && contains("${var.region_list}", "us-east-2") ? 1 : 0}"
  enable   = true
  provider = "aws.master-us-east-2"
}

resource "aws_guardduty_detector" "master-us-west-1" {
  count    = "${data.aws_caller_identity.current.account_id == "${var.master_account_id}" && contains("${var.region_list}", "us-west-1") ? 1 : 0}"
  enable   = true
  provider = "aws.master-us-west-1"
}

resource "aws_guardduty_detector" "master-us-west-2" {
  count    = "${data.aws_caller_identity.current.account_id == "${var.master_account_id}" && contains("${var.region_list}", "us-west-2") ? 1 : 0}"
  enable   = true
  provider = "aws.master-us-west-2"
}
