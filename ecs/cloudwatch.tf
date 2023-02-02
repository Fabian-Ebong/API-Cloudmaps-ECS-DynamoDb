## CloudWatch alarms for DynamoDB
resource "aws_cloudwatch_metric_alarm" "this" {
  alarm_name          = "dynamodb_${var.dynamodb_table_name}_consumed_read_units"
  comparison_operator = var.dynamodb_comparison_operator
  evaluation_periods  = var.dynamodb_evaluation_periods
  metric_name         = var.dynamodb_metric_name
  namespace           = var.dynamodb_namespace
  period              = var.dynamodb_period
  statistic           = var.dynamodb_statistic
  dimensions = {
    TableName = aws_dynamodb_table.this.name
  }
  threshold                 = var.dynamodb_consumed_read_units_threshold
  alarm_description         = "This metric monitors DynamoDB ConsumedReadCapacityUnits for ${var.dynamodb_table_name}"
  insufficient_data_actions = []
}

## CloudWatch alarms for ECS
resource "aws_cloudwatch_metric_alarm" "ecs_alarm_cpu" {
  count = var.ecs_cloudwatch_alarm_cpu_enable ? 1 : 0

  alarm_name        = "${var.ecs_cloudwatch_alarm_name}-cpu"
  alarm_description = "Monitors ECS CPU Utilization"
  alarm_actions     = var.ecs_cloudwatch_alarm_cpu_actions

  comparison_operator = var.ecs_cloudwatch_alarm_cpu_comparison_operator
  evaluation_periods  = var.ecs_cloudwatch_alarm_cpu_evaluation_periods
  metric_name         = var.ecs_cloudwatch_alarm_cpu_metric_name
  namespace           = var.ecs_cloudwatch_alarm_namespace
  period              = var.ecs_cloudwatch_alarm_cpu_period
  statistic           = var.ecs_cloudwatch_alarm_cpu_statistic
  threshold           = var.ecs_cloudwatch_alarm_cpu_threshold
  unit                = var.ecs_cloudwatch_alarm_cpu_unit

  dimensions = {
    "ClusterName" = aws_ecs_cluster.my-ecs-cluster.name
    "ServiceName" = aws_ecs_service.main.name
  }
}

resource "aws_cloudwatch_metric_alarm" "ecs_alarm_mem" {
  count = var.ecs_cloudwatch_alarm_mem_enable ? 1 : 0

  alarm_name        = "${var.ecs_cloudwatch_alarm_name}-mem"
  alarm_description = "Monitors ECS memory Utilization"
  alarm_actions     = var.ecs_cloudwatch_alarm_mem_actions

  comparison_operator = var.ecs_cloudwatch_alarm_mem_comparison_operator
  evaluation_periods  = var.ecs_cloudwatch_alarm_mem_evaluation_periods
  metric_name         = var.ecs_cloudwatch_alarm_mem_metric_name
  namespace           = var.ecs_cloudwatch_alarm_namespace
  period              = var.ecs_cloudwatch_alarm_mem_period
  statistic           = var.ecs_cloudwatch_alarm_mem_statistic
  threshold           = var.ecs_cloudwatch_alarm_mem_threshold
  unit                = var.ecs_cloudwatch_alarm_mem_unit

  dimensions = {
    "ClusterName" = aws_ecs_cluster.my-ecs-cluster.name
    "ServiceName" = aws_ecs_service.main.name
  }
}


###########################################################################

## CloudWatch alarms for API Gateway
resource "aws_cloudwatch_metric_alarm" "api_gateway_alarm_5xx" {
  count = var.api_gateway_cloudwatch_alarm_5xx_enable ? 1 : 0

  alarm_name          = "${var.api_gateway_cloudwatch_alarm_name}-5xx"
  alarm_description   = "Monitors API Gateway 5xx errors"
  alarm_actions       = var.api_gateway_cloudwatch_alarm_5xx_actions
  comparison_operator = var.api_gateway_cloudwatch_alarm_5xx_comparison_operator
  evaluation_periods  = var.api_gateway_cloudwatch_alarm_5xx_evaluation_periods
  metric_name         = var.api_gateway_cloudwatch_alarm_5xx_metric_name
  namespace           = var.api_gateway_cloudwatch_alarm_namespace
  period              = var.api_gateway_cloudwatch_alarm_5xx_period
  statistic           = var.api_gateway_cloudwatch_alarm_5xx_statistic
  threshold           = var.api_gateway_cloudwatch_alarm_5xx_threshold

  dimensions = {
    ApiName = aws_apigatewayv2_api.this.name
  }
}

resource "aws_cloudwatch_metric_alarm" "api_gateway_alarm_4xx" {
  count = var.api_gateway_cloudwatch_alarm_4xx_enable ? 1 : 0

  alarm_name          = "${var.api_gateway_cloudwatch_alarm_name}-4xx"
  alarm_description   = "Monitors API Gateway 4xx errors"
  alarm_actions       = var.api_gateway_cloudwatch_alarm_4xx_actions
  comparison_operator = var.api_gateway_cloudwatch_alarm_4xx_comparison_operator
  evaluation_periods  = var.api_gateway_cloudwatch_alarm_4xx_evaluation_periods
  metric_name         = var.api_gateway_cloudwatch_alarm_4xx_metric_name
  namespace           = var.api_gateway_cloudwatch_alarm_namespace
  period              = var.api_gateway_cloudwatch_alarm_4xx_period
  statistic           = var.api_gateway_cloudwatch_alarm_4xx_statistic
  threshold           = var.api_gateway_cloudwatch_alarm_4xx_threshold

  dimensions = {
    ApiName = aws_apigatewayv2_api.this.name
  }
}

resource "aws_cloudwatch_metric_alarm" "api_gateway_alarm_latency" {
  count = var.api_gateway_cloudwatch_alarm_latency_enable ? 1 : 0

  alarm_name          = "${var.api_gateway_cloudwatch_alarm_name}-latency"
  alarm_description   = "Monitors API Gateway latency"
  alarm_actions       = var.api_gateway_cloudwatch_alarm_latency_actions
  comparison_operator = var.api_gateway_cloudwatch_alarm_latency_comparison_operator
  evaluation_periods  = var.api_gateway_cloudwatch_alarm_latency_evaluation_periods
  metric_name         = var.api_gateway_cloudwatch_alarm_latency_metric_name
  namespace           = var.api_gateway_cloudwatch_alarm_namespace
  period              = var.api_gateway_cloudwatch_alarm_latency_period
  statistic           = var.api_gateway_cloudwatch_alarm_latency_statistic
  threshold           = var.api_gateway_cloudwatch_alarm_latency_threshold

  dimensions = {
    ApiName = aws_apigatewayv2_api.this.name
  }
}

resource "aws_cloudwatch_metric_alarm" "api_gateway_alarm_count" {
  count = var.api_gateway_cloudwatch_alarm_count_enable ? 1 : 0

  alarm_name          = "${var.api_gateway_cloudwatch_alarm_name}-count"
  alarm_description   = "Monitors API Gateway count"
  alarm_actions       = var.api_gateway_cloudwatch_alarm_count_actions
  comparison_operator = var.api_gateway_cloudwatch_alarm_count_comparison_operator
  evaluation_periods  = var.api_gateway_cloudwatch_alarm_count_evaluation_periods
  metric_name         = var.api_gateway_cloudwatch_alarm_count_metric_name
  namespace           = var.api_gateway_cloudwatch_alarm_namespace
  period              = var.api_gateway_cloudwatch_alarm_count_period
  statistic           = var.api_gateway_cloudwatch_alarm_count_statistic
  threshold           = var.api_gateway_cloudwatch_alarm_count_threshold

  dimensions = {
    ApiName = aws_apigatewayv2_api.this.name
  }
}

