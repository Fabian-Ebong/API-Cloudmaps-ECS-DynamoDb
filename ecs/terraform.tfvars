env_prefix_name = "dev-ebong"
region          = "us-east-1"

# Comma seperated security group 
allow_sg_cidr = "0.0.0.0/0"
vpc_id        = "vpc-05936f74796e57f36"

# Comma seperated private-subnet values for example "subnet-0994bf83dacbe75f4, subnet-0994bf83dacbe75f4"
private_subnets = ["subnet-006da8be6780f7723", "subnet-016b49e307871b23c"]

#Docker Image with version
ecs_docker_image = "995247101457.dkr.ecr.us-east-1.amazonaws.com/dynamodb-nodejs:latest"
ecs_cpu          = 1024
ecs_memory       = 2048
#Container port and HostPort must be same with Fargate    
ecs_containerPort       = 3000
ecs_hostPort            = 3000
ecs_desired_count       = 1
ecs_min_healthy_percent = 0
ecs_max_healthy_percent = 100

#Give s3 bucket name to keep tfstate file.
s3_tfstate_bucket_name = ""

#  ID of the Existing CloudMap Mapnamespace
cloudmap_namespace = "ns-lkjmqmwlturzsowt"

route53_primary_zone = "techfocusllc.com"

os_allow_ingres_ip                 = "119.160.99.225/32"
os_custom_endpoint                 = "kibana.techfocusllc.com"
os_custom_endpoint_certificate_arn = "arn:aws:acm:us-east-1:995247101457:certificate/58b53aeb-7e09-41f6-b7a0-3180f3a5f6fe"
os_custom_endpoint_enabled         = true
os_desired_state                   = "ENABLED"
os_domain_name                     = "es-domain"
os_ebs_enabled                     = true
os_enforce_https                   = true
os_instance_count                  = "1"
os_instance_type                   = "t3.small.elasticsearch"
os_rollback_on_disable             = "NO_ROLLBACK"
os_tls_security_policy             = "Policy-Min-TLS-1-2-2019-07"
os_version                         = "OpenSearch_1.2"
os_volume_size                     = "30"


##  CLOUDWATCH ALARMS FOR ECS CLUSTER VARIABLES
ecs_cloudwatch_alarm_name      = "ecs-cluster-alarm"
ecs_cloudwatch_alarm_namespace = "AWS/ECS"

ecs_cloudwatch_alarm_cpu_comparison_operator = "GreaterThanOrEqualToThreshold"
ecs_cloudwatch_alarm_cpu_evaluation_periods  = "1"
ecs_cloudwatch_alarm_cpu_metric_name         = "CPUUtilization"
ecs_cloudwatch_alarm_cpu_period              = "60"
ecs_cloudwatch_alarm_cpu_statistic           = "Average"
ecs_cloudwatch_alarm_cpu_enable              = true
ecs_cloudwatch_alarm_cpu_threshold           = "80"
ecs_cloudwatch_alarm_cpu_unit                = "Percent"
#ecs_cloudwatch_alarm_cpu_actions             = [aws_sns_topic.this.arn]

ecs_cloudwatch_alarm_mem_comparison_operator = "GreaterThanOrEqualToThreshold"
ecs_cloudwatch_alarm_mem_evaluation_periods  = "1"
ecs_cloudwatch_alarm_mem_metric_name         = "MemoryUtilization"
ecs_cloudwatch_alarm_mem_period              = "60"
ecs_cloudwatch_alarm_mem_statistic           = "Average"
ecs_cloudwatch_alarm_mem_enable              = true
ecs_cloudwatch_alarm_mem_threshold           = "80"
ecs_cloudwatch_alarm_mem_unit                = "Percent"
#ecs_cloudwatch_alarm_mem_actions             = [aws_sns_topic.this.arn]

##  CLOUDWATCH ALARMS FOR API GATEWAY VARIABLES
api_gateway_cloudwatch_alarm_name      = "api-gateway-alarm"
api_gateway_cloudwatch_alarm_namespace = "AWS/ApiGateway"

api_gateway_cloudwatch_alarm_5xx_enable = true
#api_gateway_cloudwatch_alarm_5xx_actions             = [aws_sns_topic.this.arn]
api_gateway_cloudwatch_alarm_5xx_comparison_operator = "GreaterThanOrEqualToThreshold"
api_gateway_cloudwatch_alarm_5xx_evaluation_periods  = "1"
api_gateway_cloudwatch_alarm_5xx_metric_name         = "5XXError"
api_gateway_cloudwatch_alarm_5xx_period              = "60"
api_gateway_cloudwatch_alarm_5xx_statistic           = "Sum"
api_gateway_cloudwatch_alarm_5xx_threshold           = "1"

api_gateway_cloudwatch_alarm_4xx_enable = true
#api_gateway_cloudwatch_alarm_4xx_actions             = [aws_sns_topic.this.arn]
api_gateway_cloudwatch_alarm_4xx_comparison_operator = "GreaterThanOrEqualToThreshold"
api_gateway_cloudwatch_alarm_4xx_evaluation_periods  = "1"
api_gateway_cloudwatch_alarm_4xx_metric_name         = "4XXError"
api_gateway_cloudwatch_alarm_4xx_period              = "60"
api_gateway_cloudwatch_alarm_4xx_statistic           = "Sum"
api_gateway_cloudwatch_alarm_4xx_threshold           = "1"

api_gateway_cloudwatch_alarm_latency_enable = true
#api_gateway_cloudwatch_alarm_latency_actions             = [aws_sns_topic.this.arn]
api_gateway_cloudwatch_alarm_latency_comparison_operator = "GreaterThanOrEqualToThreshold"
api_gateway_cloudwatch_alarm_latency_evaluation_periods  = "1"
api_gateway_cloudwatch_alarm_latency_metric_name         = "Latency"
api_gateway_cloudwatch_alarm_latency_period              = "60"
api_gateway_cloudwatch_alarm_latency_statistic           = "Average"
api_gateway_cloudwatch_alarm_latency_threshold           = "1"

api_gateway_cloudwatch_alarm_count_enable = true
#api_gateway_cloudwatch_alarm_count_actions             = [aws_sns_topic.this.arn]
api_gateway_cloudwatch_alarm_count_comparison_operator = "GreaterThanOrEqualToThreshold"
api_gateway_cloudwatch_alarm_count_evaluation_periods  = "1"
api_gateway_cloudwatch_alarm_count_metric_name         = "Count"
api_gateway_cloudwatch_alarm_count_period              = "60"
api_gateway_cloudwatch_alarm_count_statistic           = "Sum"
api_gateway_cloudwatch_alarm_count_threshold           = "1"

## AWS DYNAMODB TABLE VARIABLES
dynamodb_table_name          = "Users"
dynamodb_hash_key            = "service_name"    # service_name(you can change according to it)
dynamodb_range_key           = "email"           # email
dynamodb_billing_mode        = "PAY_PER_REQUEST" # it is option for provision it's up to you what you want = "PROVISIONED"
dynamodb_stream_enabled      = "true"
stream_view_type             = "NEW_AND_OLD_IMAGES"
dynamodb_replica_region_name = "us-west-2"

## AWS CLOUDWATCH ALARM FOR DYNAMODB TABLE VARIABLES
ecs_cloudwatch_alarm_dynamodb_enable = true
# ecs_cloudwatch_alarm_dynamodb_actions  = [aws_sns_topic.this.arn]
dynamodb_comparison_operator           = "GreaterThanOrEqualToThreshold"
dynamodb_evaluation_periods            = "1"
dynamodb_metric_name                   = "ConsumedReadCapacityUnits"
dynamodb_namespace                     = "AWS/DynamoDB"
dynamodb_period                        = "60"
dynamodb_statistic                     = "Maximum"
dynamodb_consumed_read_units_threshold = "1"

## SNS VARIABLES
sns_topic_name = "cloudwatch-alarm-sns-topic"

## SNS SUBSCRIPTION VARIABLES
sns_subscription_protocol = "sms"
sns_subscription_endpoint = "+923058180265"

## S3 variables

cloudtrail_s3_bucket_name = "terraform-cloudtrail-bucket"
cloudtrail_s3_bucket_acl  = "private"

## CLOUDTRAIL VARIABLES
cloudtrail_log_group_name                = "/aws/cloudtrail"
cloudtrail_log_group_retention_in_days   = 30
cloudtrail_name                          = "cloudtrail"
cloudtrail_s3_key_prefix                 = "cloudtrail"
cloudtrail_include_global_service_events = true
cloudtrail_is_multi_region_trail         = true
cloudtrail_is_organization_trail         = true
cloudtrail_enable_log_file_validation    = true
cloudtrail_enable_logging                = true

cloudtrail_assume_role_policy_actons                = ["sts:AssumeRole"]
cloudtrail_assume_role_policy_principal_type        = "Service"
cloudtrail_assume_role_policy_principal_identifiers = ["cloudwatch.amazonaws.com", "cloudtrail.amazonaws.com"]
cloudtrail_role_name                                = "cloudtrail_role"
cloudtrail_policy_name                              = "cloudtrail_policy"
cloudtrail_policy_document_effect                   = "Allow"
cloudtrail_policy_document_actions = [
  "logs:CreateLogGroup",
  "logs:CreateLogStream",
  "logs:PutLogEvents",
  "logs:DescribeLogStreams",
  "logs:DescribeLogGroups"
]
cloudtrail_policy_document_resources = ["*"]


# ECS VARIABLES BUCKET VARIABLES
ecs_var_bucket_name = "terraform-ecs-env-var-bucket"
ecs_var_bucket_acl  = "private"
ecs_env_file_name   = "ecs.env"