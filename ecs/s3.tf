data "aws_caller_identity" "currentt" {}
# create s3 bucker for cloudtrail logs

resource "aws_s3_bucket" "cloudtrail_bucket" {
  bucket = var.cloudtrail_s3_bucket_name
  tags = {
    Name = "${var.cloudtrail_s3_bucket_name}"
  }
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.cloudtrail_bucket.id
  acl    = var.cloudtrail_s3_bucket_acl
}

resource "aws_s3_bucket_policy" "cloudtrail_bucket_policy" {
  bucket     = aws_s3_bucket.cloudtrail_bucket.id
  depends_on = [aws_s3_bucket.cloudtrail_bucket]
  policy     = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": [
                "cloudtrail.amazonaws.com",
                "config.amazonaws.com"
              ]
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "${aws_s3_bucket.cloudtrail_bucket.arn}"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": [
                "cloudtrail.amazonaws.com",
                "config.amazonaws.com"
              ]
            },
            "Action": "s3:PutObject",
            "Resource": "${aws_s3_bucket.cloudtrail_bucket.arn}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}


#################### ECS VARIABLES BUCKET ####################

resource "aws_s3_bucket" "ecs_var_bucket" {
  bucket = var.ecs_var_bucket_name
  tags = {
    Name = "${var.ecs_var_bucket_name}"
  }
}

resource "aws_s3_bucket_acl" "ecs_var_bucket_acl" {
  bucket     = aws_s3_bucket.ecs_var_bucket.id
  depends_on = [aws_s3_bucket.ecs_var_bucket]
  acl        = var.ecs_var_bucket_acl
}

resource "aws_s3_object" "ecs_var_bucket_object" {
  bucket     = aws_s3_bucket.ecs_var_bucket.id
  depends_on = [aws_s3_bucket.ecs_var_bucket]
  key        = var.ecs_env_file_name
  source     = "./${var.ecs_env_file_name}"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("./${var.ecs_env_file_name}")
}