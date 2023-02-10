# sns topic with email subscription for cloudwatch alarms
resource "aws_sns_topic" "this" {
  name = var.sns_topic_name
}

resource "aws_sns_topic_subscription" "this" {
  topic_arn = aws_sns_topic.this.arn
  protocol  = var.sns_subscription_protocol
  endpoint  = var.sns_subscription_endpoint
}
