# implement AWS GuardDuty ThreatIntelSet (blacklist)
`aws_guardduty_threatintelset` - [Terraform](https://www.terraform.io/docs/providers/aws/r/guardduty_threatintelset.html)

```
## S3 bucket name or ID required

# Create S3 object file
#   s3://<bucket>/<key>
#   https://<bucket>/<key>
resource "aws_s3_bucket_object" "blacklist_threatintelset" {
  acl     = "public-read"
  content = "123.45.67.89/32\n124.35.67.0/24\n"
  bucket  = "${aws_s3_bucket.bucket.id}"
  key     = "threatintelset/blacklist.txt"
}

# needs to be done per region per guardduty detector id
resource "aws_guardduty_threatintelset" "blacklist_ap-south-1" {
  provider = "aws.master-ap-south-1"
  activate    = true
  detector_id = "${aws_guardduty_detector.master-ap-south-1.id}"
  format      = "TXT"
  location    = "https://s3.amazonaws.com/${aws_s3_bucket_object.blacklist_threatintelset.bucket}/${aws_s3_bucket_object.blacklist_threatintelset.key}"
  name        = "blacklist_threatintelset"
}

resource "aws_guardduty_threatintelset" "blacklist_eu-west-3" {
  provider = "aws.master-eu-west-3"
  activate    = true
  detector_id = "${aws_guardduty_detector.master-eu-west-3.id}"
  format      = "TXT"
  location    = "https://s3.amazonaws.com/${aws_s3_bucket_object.blacklist_threatintelset.bucket}/${aws_s3_bucket_object.blacklist_threatintelset.key}"
  name        = "blacklist_threatintelset"
}

...

```

# implement AWS GuardDuty IPSet (whitelistlist)
`aws_guardduty_ipset` - [Terraform](https://www.terraform.io/docs/providers/aws/r/guardduty_ipset.html)

```
## S3 bucket name or ID required

# Create S3 object file
#   s3://<bucket>/<key>
#   https://<bucket>/<key>
resource "aws_s3_bucket_object" "whitelist_ipset" {
  acl     = "public-read"
  content = "172.16.21.31/32\n192.168.13.0/24\n"
  bucket  = "${aws_s3_bucket.bucket.id}"
  key     = "whitelistipset/whitelist.txt"
}

# needs to be done per region per guardduty detector id
resource "aws_guardduty_ipset" "whitelist_ap-south-1" {
  provider = "aws.master-ap-south-1"
  activate    = true
  detector_id = "${aws_guardduty_detector.master-ap-south-1.id}"
  format      = "TXT"
  location    = "https://s3.amazonaws.com/${aws_s3_bucket_object.whitelist_ipset.bucket}/${aws_s3_bucket_object.whitelist_ipset.key}"
  name        = "whitelist_ipset"
}

resource "aws_guardduty_ipset" "whitelist_eu-west-3" {
  provider = "aws.master-eu-west-3"
  activate    = true
  detector_id = "${aws_guardduty_detector.master-eu-west-3.id}"
  format      = "TXT"
  location    = "https://s3.amazonaws.com/${aws_s3_bucket_object.whitelist_ipset.bucket}/${aws_s3_bucket_object.whitelist_ipset.key}"
  name        = "whitelist_ipset"
}

...

```
