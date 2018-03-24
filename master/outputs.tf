output "master-ap-south-1" {
  depends_on = ["${contains("${var.region_list}", "ap-south-1") ? 1 : 0}"]
  value      = "${aws_guardduty_detector.master-ap-south-1.*.id}"
}

output "master-eu-west-3" {
  depends_on = ["${contains("${var.region_list}", "eu-west-3") ? 1 : 0}"]
  value      = "${aws_guardduty_detector.master-eu-west-3.*.id}"
}

output "master-eu-west-2" {
  depends_on = ["${contains("${var.region_list}", "eu-west-2") ? 1 : 0}"]
  value      = "${aws_guardduty_detector.master-eu-west-2.*.id}"
}

output "master-eu-west-1" {
  depends_on = ["${contains("${var.region_list}", "eu-west-1") ? 1 : 0}"]
  value      = "${aws_guardduty_detector.master-eu-west-1.*.id}"
}

output "master-ap-northeast-2" {
  depends_on = ["${contains("${var.region_list}", "ap-northeast-2") ? 1 : 0}"]
  value      = "${aws_guardduty_detector.master-ap-northeast-2.*.id}"
}

output "master-ap-northeast-1" {
  depends_on = ["${contains("${var.region_list}", "ap-northeast-1") ? 1 : 0}"]
  value      = "${aws_guardduty_detector.master-ap-northeast-1.*.id}"
}

output "master-sa-east-1" {
  depends_on = ["${contains("${var.region_list}", "sa-east-1") ? 1 : 0}"]
  value      = "${aws_guardduty_detector.master-sa-east-1.*.id}"
}

output "master-ca-central-1" {
  depends_on = ["${contains("${var.region_list}", "ca-central-1") ? 1 : 0}"]
  value      = "${aws_guardduty_detector.master-ca-central-1.*.id}"
}

output "master-ap-southeast-1" {
  depends_on = ["${contains("${var.region_list}", "ap-southeast-1") ? 1 : 0}"]
  value      = "${aws_guardduty_detector.master-ap-southeast-1.*.id}"
}

output "master-ap-southeast-2" {
  depends_on = ["${contains("${var.region_list}", "ap-southeast-2") ? 1 : 0}"]
  value      = "${aws_guardduty_detector.master-ap-southeast-2.*.id}"
}

output "master-eu-central-1" {
  depends_on = ["${contains("${var.region_list}", "eu-central-1") ? 1 : 0}"]
  value      = "${aws_guardduty_detector.master-eu-central-1.*.id}"
}

output "master-us-east-1" {
  depends_on = ["${contains("${var.region_list}", "us-east-1") ? 1 : 0}"]
  value      = "${aws_guardduty_detector.master-us-east-1.*.id}"
}

output "master-us-east-2" {
  depends_on = ["${contains("${var.region_list}", "us-east-2") ? 1 : 0}"]
  value      = "${aws_guardduty_detector.master-us-east-2.*.id}"
}

output "master-us-west-1" {
  depends_on = ["${contains("${var.region_list}", "us-west-1") ? 1 : 0}"]
  value      = "${aws_guardduty_detector.master-us-west-1.*.id}"
}

output "master-us-west-2" {
  depends_on = ["${contains("${var.region_list}", "us-west-2") ? 1 : 0}"]
  value      = "${aws_guardduty_detector.master-us-west-2.*.id}"
}
