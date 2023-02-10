variable "env_prefix_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "ecs_docker_image" {
  type = string
}

variable "ecs_cpu" {
  type = string
}


variable "ecs_memory" {
  type = string
}
variable "ecs_containerPort" {
  type = string
}

variable "ecs_hostPort" {
  type = string
}

variable "region" {
  type = string
}

variable "private_subnets" {
  type = list(any)
}

variable "ecs_desired_count" {
  type = string
}
variable "ecs_min_healthy_percent" {
  type = string
}
variable "ecs_max_healthy_percent" {
  type = string
}
variable "allow_sg_cidr" {

}
variable "s3_tfstate_bucket_name" {

}
variable "cloudmap_namespace" {

}

########OPEN Search###########

variable "os_domain_name" {
  description = "Open Search Domain Name"
  type        = string
}

variable "os_version" {
  type        = string
  description = "version opensearch"
}

variable "os_enforce_https" {
  type        = string
  description = "Enforce https on opensearch"
}

variable "os_tls_security_policy" {
  type        = string
  description = "TLS security for opensearch"
}

variable "os_custom_endpoint_enabled" {
  type        = string
  description = "OpenSearch custom endpoint"
}

variable "os_custom_endpoint" {
  type        = string
  description = "fully qualified domain name"
}

variable "os_custom_endpoint_certificate_arn" {
  type        = string
  description = "Certificate ARN"
}

variable "os_desired_state" {
  type        = string
  description = "Desired state"
}

variable "os_rollback_on_disable" {
  type        = string
  description = "Options on rollback"
}

variable "os_ebs_enabled" {
  type        = string
  description = "EBS storage"
}

variable "os_volume_size" {
  type        = string
  description = "EBS volume Size"
}

variable "os_instance_type" {
  type        = string
  description = "OS Instance Type"
}

variable "os_instance_count" {
  type        = string
  description = "Instnace count for OS"
}

variable "os_allow_ingres_ip" {
  type        = string
  description = "Open VPN IP to whitelist in OS"
}

######## ECS ###########
variable "ecs_cloudwatch_alarm_cpu_comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand."
  type        = string
}

variable "ecs_cloudwatch_alarm_mem_comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand."
  type        = string
}

variable "ecs_cloudwatch_alarm_cpu_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = string
}

variable "ecs_cloudwatch_alarm_mem_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = string
}

variable "ecs_cloudwatch_alarm_cpu_metric_name" {
  description = "The name for the alarm's associated metric."
  type        = string
}

variable "ecs_cloudwatch_alarm_mem_metric_name" {
  description = "The name for the alarm's associated metric."
  type        = string
}

variable "ecs_cloudwatch_alarm_namespace" {
  description = "The namespace for the alarm's associated metric."
  type        = string
}

variable "ecs_cloudwatch_alarm_cpu_period" {
  description = "The period in seconds over which the specified statistic is applied."
  type        = string
}

variable "ecs_cloudwatch_alarm_mem_period" {
  description = "The period in seconds over which the specified statistic is applied."
  type        = string
}

variable "ecs_cloudwatch_alarm_cpu_statistic" {
  description = "The statistic to apply to the alarm's associated metric."
  type        = string
}

variable "ecs_cloudwatch_alarm_mem_statistic" {
  description = "The statistic to apply to the alarm's associated metric."
  type        = string
}

variable "ecs_cloudwatch_alarm_name" {
  description = "Generic name used for CPU and Memory Cloudwatch Alarms"
  default     = ""
  type        = string
}

# variable "ecs_cloudwatch_alarm_cpu_actions" {
#   description = "The list of actions to take for cloudwatch alarms"
#   type        = list(string)
# }

# variable "ecs_cloudwatch_alarm_mem_actions" {
#   description = "The list of actions to take for cloudwatch alarms"
#   type        = list(string)
# }

variable "ecs_cloudwatch_alarm_cpu_enable" {
  description = "Enable the CPU Utilization CloudWatch metric alarm"
  type        = bool
}

variable "ecs_cloudwatch_alarm_cpu_threshold" {
  description = "The CPU Utilization threshold for the CloudWatch metric alarm"
  type        = number
}

variable "ecs_cloudwatch_alarm_mem_enable" {
  description = "Enable the Memory Utilization CloudWatch metric alarm"
  type        = bool
}

variable "ecs_cloudwatch_alarm_mem_threshold" {
  description = "The Memory Utilization threshold for the CloudWatch metric alarm"
  type        = number
}

variable "ecs_cloudwatch_alarm_mem_unit" {
  description = "The unit for the alarm's associated metric."
  type        = string
}

variable "ecs_cloudwatch_alarm_cpu_unit" {
  description = "The unit for the alarm's associated metric."
  type        = string
}


######## API Gateway ###########
variable "api_gateway_cloudwatch_alarm_name" {
  description = "Generic name used for 4xx and 5xx Cloudwatch Alarms"
  type        = string
}

variable "api_gateway_cloudwatch_alarm_namespace" {
  description = "The namespace for the alarm's associated metric."
  type        = string
}

variable "api_gateway_cloudwatch_alarm_5xx_enable" {
  description = "Enable the 5xx Error Rate CloudWatch metric alarm"
  type        = bool
}

variable "api_gateway_cloudwatch_alarm_5xx_threshold" {
  description = "The 5xx Error Rate threshold for the CloudWatch metric alarm"
  type        = number
}

# variable "api_gateway_cloudwatch_alarm_5xx_actions" {
#   description = "The list of actions to take for cloudwatch alarms"
#   type        = list(string)
# }

variable "api_gateway_cloudwatch_alarm_4xx_enable" {
  description = "Enable the 4xx Error Rate CloudWatch metric alarm"
  type        = bool
}

variable "api_gateway_cloudwatch_alarm_4xx_threshold" {
  description = "The 4xx Error Rate threshold for the CloudWatch metric alarm"
  type        = number
}

# variable "api_gateway_cloudwatch_alarm_4xx_actions" {
#   description = "The list of actions to take for cloudwatch alarms"
#   type        = list(string)
# }

variable "api_gateway_cloudwatch_alarm_latency_enable" {
  description = "Enable the Latency CloudWatch metric alarm"
  type        = bool
}

variable "api_gateway_cloudwatch_alarm_latency_threshold" {
  description = "The Latency threshold for the CloudWatch metric alarm"
  type        = number
}

# variable "api_gateway_cloudwatch_alarm_latency_actions" {
#   description = "The list of actions to take for cloudwatch alarms"
#   type        = list(string)
# }

variable "api_gateway_cloudwatch_alarm_count_enable" {
  description = "Enable the Latency CloudWatch metric alarm"
  type        = bool
}

variable "api_gateway_cloudwatch_alarm_count_threshold" {
  description = "The Latency threshold for the CloudWatch metric alarm"
  type        = number
}

# variable "api_gateway_cloudwatch_alarm_count_actions" {
#   description = "The list of actions to take for cloudwatch alarms"
#   type        = list(string)
# }

variable "api_gateway_cloudwatch_alarm_5xx_comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand."
  type        = string
}

variable "api_gateway_cloudwatch_alarm_4xx_comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand."
  type        = string
}

variable "api_gateway_cloudwatch_alarm_latency_comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand."
  type        = string
}

variable "api_gateway_cloudwatch_alarm_count_comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand."
  type        = string
}

variable "api_gateway_cloudwatch_alarm_5xx_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = string
}

variable "api_gateway_cloudwatch_alarm_4xx_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = string
}

variable "api_gateway_cloudwatch_alarm_latency_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = string
}

variable "api_gateway_cloudwatch_alarm_count_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = string
}

variable "api_gateway_cloudwatch_alarm_5xx_metric_name" {
  description = "The name for the alarm's associated metric."
  type        = string
}

variable "api_gateway_cloudwatch_alarm_4xx_metric_name" {
  description = "The name for the alarm's associated metric."
  type        = string
}

variable "api_gateway_cloudwatch_alarm_latency_metric_name" {
  description = "The name for the alarm's associated metric."
  type        = string
}

variable "api_gateway_cloudwatch_alarm_count_metric_name" {
  description = "The name for the alarm's associated metric."
  type        = string
}

variable "api_gateway_cloudwatch_alarm_5xx_period" {
  description = "The period in seconds over which the specified statistic is applied."
  type        = string
}

variable "api_gateway_cloudwatch_alarm_4xx_period" {
  description = "The period in seconds over which the specified statistic is applied."
  type        = string
}

variable "api_gateway_cloudwatch_alarm_latency_period" {
  description = "The period in seconds over which the specified statistic is applied."
  type        = string
}

variable "api_gateway_cloudwatch_alarm_count_period" {
  description = "The period in seconds over which the specified statistic is applied."
  type        = string
}

variable "api_gateway_cloudwatch_alarm_5xx_statistic" {
  description = "The statistic to apply to the alarm's associated metric."
  type        = string
}

variable "api_gateway_cloudwatch_alarm_4xx_statistic" {
  description = "The statistic to apply to the alarm's associated metric."
  type        = string
}

variable "api_gateway_cloudwatch_alarm_latency_statistic" {
  description = "The statistic to apply to the alarm's associated metric."
  type        = string
}

variable "api_gateway_cloudwatch_alarm_count_statistic" {
  description = "The statistic to apply to the alarm's associated metric."
  type        = string
}

variable "cloudtrail_enable_logging" {
  type        = string
  description = "cloudtrail log file for validation"
}


## Dynamodb variables
variable "dynamodb_table_name" {
  type        = string
  description = "DynamoDB table name"
}

#hash_key
variable "dynamodb_hash_key" {
  type        = string
  description = "DynamoDB table hash key"
}
#sort_key
variable "dynamodb_range_key" {
  type        = string
  description = "DynamoDB table range key"
}
#billing mode
variable "dynamodb_billing_mode" {
  type        = string
  description = "DynamoDB table billing mode"
}
#stream enabled
variable "dynamodb_stream_enabled" {
  type        = string
  description = "DynamoDB table stream enabled"
}
#stream view 
variable "stream_view_type" {
  type        = string
  description = "DynamoDB table stream view"
}

#region for replication
variable "dynamodb_replica_region_name" {
  type        = string
  description = "DynamoDB table region for replication"
}

# Dynamodb CLOUDWATCH VARIABLES
variable "ecs_cloudwatch_alarm_dynamodb_enable" {
  type        = bool
  description = "Enable cloudwatch alarm for dynamodb"
}

# variable "ecs_cloudwatch_alarm_dynamodb_actions" {
#   type        = list(string)
#   description = "The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN)"
# }

variable "dynamodb_comparison_operator" {
  type        = string
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand."
}
variable "dynamodb_evaluation_periods" {
  type        = number
  description = "Number of periods over which data is compared to the specified threshold"
}
variable "dynamodb_metric_name" {
  type        = string
  description = "The name for the metric"
}
variable "dynamodb_namespace" {
  type        = string
  description = "The namespace for the metric"
}
variable "dynamodb_period" {
  type        = number
  description = "The length, in seconds, used each time the metric specified in MetricName is evaluated"
}
variable "dynamodb_statistic" {
  type        = string
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
}

variable "dynamodb_consumed_read_units_threshold" {
  type        = number
  description = "The value against which the specified statistic is compared"
}
variable "route53_primary_zone" {
  type        = string
  description = "Route 53 DNS Zone"
}

## SNS VARIABLES
variable "sns_topic_name" {
  type        = string
  description = "SNS topic name"
}

## SNS SUBSCRIPTION VARIABLES
variable "sns_subscription_protocol" {
  type        = string
  description = "SNS topic protocol type"
}

variable "sns_subscription_endpoint" {
  type        = string
  description = "SNS topic endpoint email"
}

## S3 variables
variable "cloudtrail_s3_bucket_name" {
  type        = string
  description = "S3 bucket name for CloudTrail"
}

variable "cloudtrail_s3_bucket_acl" {
  type        = string
  description = "S3 bucket acl for CloudTrail"
}

## CLOUDTRAIL VARIABLES
variable "cloudtrail_log_group_name" {
  type        = string
  description = "CloudTrail log group name"
}

variable "cloudtrail_log_group_retention_in_days" {
  type        = number
  description = "CloudTrail log group retention in days"
}

variable "cloudtrail_name" {
  type        = string
  description = "CloudTrail name"
}

variable "cloudtrail_s3_key_prefix" {
  type        = string
  description = "CloudTrail name"
}

variable "cloudtrail_include_global_service_events" {
  type        = bool
  description = "CloudTrail include global service events"
}

variable "cloudtrail_is_multi_region_trail" {
  type        = bool
  description = "CloudTrail is multi region trail"
}

variable "cloudtrail_is_organization_trail" {
  type        = bool
  description = "CloudTrail is organization trail"
}

variable "cloudtrail_enable_log_file_validation" {
  type        = bool
  description = "CloudTrail enable log file validation"
}

variable "cloudtrail_assume_role_policy_actons" {
  type        = list(string)
  description = "CloudTrail role policy document actions"
}

variable "cloudtrail_assume_role_policy_principal_type" {
  type        = string
  description = "CloudTrail role policy document principal type"
}

variable "cloudtrail_assume_role_policy_principal_identifiers" {
  type        = list(string)
  description = "CloudTrail role policy document principal identifiers"
}

variable "cloudtrail_role_name" {
  type        = string
  description = "CloudTrail role name"
}

variable "cloudtrail_policy_name" {
  type        = string
  description = "CloudTrail role path"
}

variable "cloudtrail_policy_document_effect" {
  type        = string
  description = "CloudTrail role policy document"
}

variable "cloudtrail_policy_document_actions" {
  type        = list(string)
  description = "CloudTrail role policy document actions"
}

variable "cloudtrail_policy_document_resources" {
  type        = list(string)
  description = "CloudTrail role policy document resources"
}

#################### ECS VARIABLES BUCKET VARIABLES ####################

variable "ecs_var_bucket_name" {
  type        = string
  description = "S3 bucket name for ECS"
}

variable "ecs_var_bucket_acl" {
  type        = string
  description = "S3 bucket acl for ECS"
}

variable "ecs_env_file_name" {
  type        = string
  description = "ECS env file name"
}