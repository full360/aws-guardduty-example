resource "aws_s3_bucket" "proof-of-concept-gd-state" {
  bucket = "proof-of-concept-gd-state"
  acl    = "private"
  region = "us-east-1"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }


  # overly permissive
  # minimums will be GetObject and some version of ListObjects
  #   so we can copy a whole slew of files at once
  policy = <<POLICY
{
    "Id": "PolicyArgument",
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "StmtArgument",
            "Action": [
                "s3:GetObject",
                "s3:ListBucket",
                "s3:PutObject"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::proof-of-concept-gd-state",
                "arn:aws:s3:::proof-of-concept-gd-state/*"
            ],
            "Principal": {
                "AWS": [
                    "arn:aws:iam::123456789012:root"
                ]
            }
        }
    ]
}
POLICY
}

## This is for a shared bucket with multiple accounts doing updates
#resource "aws_s3_bucket" "proof-of-concept-gd-state" {
#  bucket = "proof-of-concept-gd-state"
#  acl    = "private"
#  region = "us-east-1"
#
#  versioning {
#    enabled = true
#  }
#
#  server_side_encryption_configuration {
#    rule {
#      apply_server_side_encryption_by_default {
#        sse_algorithm     = "AES256"
#      }
#    }
#  }
#
#  # overly permissive
#  # minimums will be GetObject and some version of ListObjects
#  #   so we can copy a whole slew of files at once
#  policy = <<POLICY
#{
#    "Id": "PolicyArgument",
#    "Version": "2012-10-17",
#    "Statement": [
#        {
#            "Sid": "StmtArgument001",
#            "Action": [
#                "s3:GetObject",
#                "s3:ListBucket",
#                "s3:PutObject"
#            ],
#            "Effect": "Allow",
#            "Resource": [
#                "arn:aws:s3:::proof-of-concept-gd-state",
#                "arn:aws:s3:::proof-of-concept-gd-state/*"
#            ],
#            "Principal": {
#                "AWS": [
#                    "arn:aws:iam::123456789012:root",
#                    "arn:aws:iam::234567890123:root",
#                    "arn:aws:iam::345678901234:root"
#                ]
#            }
#        }
#    ]
#}
#POLICY
#}
