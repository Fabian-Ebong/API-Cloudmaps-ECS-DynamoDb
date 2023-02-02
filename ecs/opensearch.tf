data "aws_caller_identity" "current" {}

resource "aws_iam_service_linked_role" "os" {
  aws_service_name = "es.amazonaws.com"
}


data "aws_route53_zone" "primary" {
  name = "${var.route53_primary_zone}"
}

resource "aws_route53_record" "ecs_lb_record" {
  name    = "${var.os_custom_endpoint}"
  zone_id = "${data.aws_route53_zone.primary.zone_id}"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_elasticsearch_domain.os.endpoint}"]
}


resource "aws_elasticsearch_domain" "os" {
  domain_name           = var.os_domain_name
  elasticsearch_version = var.os_version

  lifecycle {
    ignore_changes = all
  }

  encrypt_at_rest {
    enabled = true
  }
  domain_endpoint_options {
    enforce_https                   = var.os_enforce_https
    tls_security_policy             = var.os_tls_security_policy
    custom_endpoint_enabled         = var.os_custom_endpoint_enabled
    custom_endpoint                 = var.os_custom_endpoint
    custom_endpoint_certificate_arn = var.os_custom_endpoint_certificate_arn
  }
  auto_tune_options {
    desired_state       = var.os_desired_state
    rollback_on_disable = var.os_rollback_on_disable
  }
  ebs_options {
    ebs_enabled = var.os_ebs_enabled
    volume_size = var.os_volume_size
  }

  cluster_config {
    instance_type  = var.os_instance_type
    instance_count = var.os_instance_count
  }
  access_policies = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "es:*",
      "Principal": "*",
      "Effect": "Allow",
      "Resource": "arn:aws:es:${var.region}:${data.aws_caller_identity.current.account_id}:domain/${var.os_domain_name}/*",
      "Condition": {
        "IpAddress": {"aws:SourceIp": ["${var.os_allow_ingres_ip}"]}
      }
    }
  ]
}
POLICY
  depends_on      = [aws_iam_service_linked_role.os]

}

