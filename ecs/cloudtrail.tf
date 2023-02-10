# create cloudwatch log group for cloudtrail
resource "aws_cloudwatch_log_group" "cloudtrail_log_group" {
  name              = var.cloudtrail_log_group_name
  retention_in_days = var.cloudtrail_log_group_retention_in_days
}

# enable cloudtrail and send logs to the s3 bucket
resource "aws_cloudtrail" "cloudtrail" {
  name                          = var.cloudtrail_name
  s3_bucket_name                = aws_s3_bucket.cloudtrail_bucket.id
  s3_key_prefix                 = var.cloudtrail_s3_key_prefix
  include_global_service_events = var.cloudtrail_include_global_service_events
  is_multi_region_trail         = var.cloudtrail_is_multi_region_trail
  enable_log_file_validation    = var.cloudtrail_enable_log_file_validation
  enable_logging                = var.cloudtrail_enable_logging
  cloud_watch_logs_group_arn    = "${aws_cloudwatch_log_group.cloudtrail_log_group.arn}:*"
  cloud_watch_logs_role_arn     = aws_iam_role.cloudtrail_role.arn
  depends_on                    = [aws_s3_bucket_policy.cloudtrail_bucket_policy, aws_s3_bucket.cloudtrail_bucket]
}

data "aws_iam_policy_document" "cloudtrail_assume_role_policy" {
  statement {
    actions = var.cloudtrail_assume_role_policy_actons

    principals {
      type        = var.cloudtrail_assume_role_policy_principal_type
      identifiers = var.cloudtrail_assume_role_policy_principal_identifiers
    }
  }
}

# create iam role for cloudtrail
resource "aws_iam_role" "cloudtrail_role" {
  name               = var.cloudtrail_role_name
  assume_role_policy = data.aws_iam_policy_document.cloudtrail_assume_role_policy.json
}

# create iam role policy for cloudtrail
resource "aws_iam_role_policy_attachment" "cloudtrail_role_policy_attachment" {
  role       = aws_iam_role.cloudtrail_role.name
  policy_arn = aws_iam_policy.cloudtrail_policy.arn
}


# create iam policy for cloudtrail
resource "aws_iam_policy" "cloudtrail_policy" {
  name        = var.cloudtrail_policy_name
  description = var.cloudtrail_policy_name
  policy      = data.aws_iam_policy_document.cloudtrail_policy_document.json
}

# create iam policy document for cloudtrail
data "aws_iam_policy_document" "cloudtrail_policy_document" {
  statement {
    effect    = var.cloudtrail_policy_document_effect
    actions   = var.cloudtrail_policy_document_actions
    resources = var.cloudtrail_policy_document_resources
  }
}
