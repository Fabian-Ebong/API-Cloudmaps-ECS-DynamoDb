env_prefix_name = "dev-ebong"
region          = "us-east-1"

# Comma seperated security group 
allow_sg_cidr = "0.0.0.0/0"
vpc_id        = "vpc-08982fe9562794148"

# Comma seperated private-subnet values for example "subnet-0994bf83dacbe75f4, subnet-0994bf83dacbe75f4"
private_subnets = "subnet-01f3ecf19f3a6dbcb"

#Docker Image with version
ecs_docker_image = "465587469711.dkr.ecr.us-east-1.amazonaws.com/ebong:latest"
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

openvpn_ip                         = "0.0.0.0/0"
os_custom_endpoint                 = "devkibana.xyz.com"
os_custom_endpoint_certificate_arn = ""
os_custom_endpoint_enabled         = true
os_desired_state                   = "ENABLED"
os_domain_name                     = "xyz-kibana"
os_ebs_enabled                     = true
os_enforce_https                   = true
os_instance_count                  = "1"
os_instance_type                   = "m5.large.elasticsearch"
os_rollback_on_disable             = "NO_ROLLBACK"
os_tls_security_policy             = "Policy-Min-TLS-1-2-2019-07"
os_version                         = "OpenSearch_1.2"
os_volume_size                     = "512"


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
ecs_cloudwatch_alarm_cpu_actions             = []

ecs_cloudwatch_alarm_mem_comparison_operator = "GreaterThanOrEqualToThreshold"
ecs_cloudwatch_alarm_mem_evaluation_periods  = "1"
ecs_cloudwatch_alarm_mem_metric_name         = "MemoryUtilization"
ecs_cloudwatch_alarm_mem_period              = "60"
ecs_cloudwatch_alarm_mem_statistic           = "Average"
ecs_cloudwatch_alarm_mem_enable              = true
ecs_cloudwatch_alarm_mem_threshold           = "80"
ecs_cloudwatch_alarm_mem_unit                = "Percent"
ecs_cloudwatch_alarm_mem_actions             = []

##  CLOUDWATCH ALARMS FOR API GATEWAY VARIABLES
api_gateway_cloudwatch_alarm_name      = "api-gateway-alarm"
api_gateway_cloudwatch_alarm_namespace = "AWS/ApiGateway"

api_gateway_cloudwatch_alarm_5xx_enable              = true
api_gateway_cloudwatch_alarm_5xx_actions             = []
api_gateway_cloudwatch_alarm_5xx_comparison_operator = "GreaterThanOrEqualToThreshold"
api_gateway_cloudwatch_alarm_5xx_evaluation_periods  = "1"
api_gateway_cloudwatch_alarm_5xx_metric_name         = "5XXError"
api_gateway_cloudwatch_alarm_5xx_period              = "60"
api_gateway_cloudwatch_alarm_5xx_statistic           = "Sum"
api_gateway_cloudwatch_alarm_5xx_threshold           = "1"

api_gateway_cloudwatch_alarm_4xx_enable              = true
api_gateway_cloudwatch_alarm_4xx_actions             = []
api_gateway_cloudwatch_alarm_4xx_comparison_operator = "GreaterThanOrEqualToThreshold"
api_gateway_cloudwatch_alarm_4xx_evaluation_periods  = "1"
api_gateway_cloudwatch_alarm_4xx_metric_name         = "4XXError"
api_gateway_cloudwatch_alarm_4xx_period              = "60"
api_gateway_cloudwatch_alarm_4xx_statistic           = "Sum"
api_gateway_cloudwatch_alarm_4xx_threshold           = "1"

api_gateway_cloudwatch_alarm_latency_enable              = true
api_gateway_cloudwatch_alarm_latency_actions             = []
api_gateway_cloudwatch_alarm_latency_comparison_operator = "GreaterThanOrEqualToThreshold"
api_gateway_cloudwatch_alarm_latency_evaluation_periods  = "1"
api_gateway_cloudwatch_alarm_latency_metric_name         = "Latency"
api_gateway_cloudwatch_alarm_latency_period              = "60"
api_gateway_cloudwatch_alarm_latency_statistic           = "Average"
api_gateway_cloudwatch_alarm_latency_threshold           = "1"

api_gateway_cloudwatch_alarm_count_enable              = true
api_gateway_cloudwatch_alarm_count_actions             = []
api_gateway_cloudwatch_alarm_count_comparison_operator = "GreaterThanOrEqualToThreshold"
api_gateway_cloudwatch_alarm_count_evaluation_periods  = "1"
api_gateway_cloudwatch_alarm_count_metric_name         = "Count"
api_gateway_cloudwatch_alarm_count_period              = "60"
api_gateway_cloudwatch_alarm_count_statistic           = "Sum"
api_gateway_cloudwatch_alarm_count_threshold           = "1"

## AWS DYNAMODB TABLE VARIABLES
dynamodb_table_name          = "Users"
dynamodb_hash_key            = "uid"
dynamodb_range_key           = "title"
dynamodb_billing_mode        = "PAY_PER_REQUEST"
dynamodb_stream_enabled      = "true"
dynamodb_replica_region_name = "us-west-1"

## AWS CLOUDWATCH ALARM FOR DYNAMODB TABLE VARIABLES
dynamodb_comparison_operator           = "GreaterThanOrEqualToThreshold"
dynamodb_evaluation_periods            = "1"
dynamodb_metric_name                   = "ConsumedReadCapacityUnits"
dynamodb_namespace                     = "AWS/DynamoDB"
dynamodb_period                        = "60"
dynamodb_statistic                     = "Maximum"
dynamodb_consumed_read_units_threshold = "1"