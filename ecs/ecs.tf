resource "aws_ecs_cluster" "my-ecs-cluster" {
  name = "${var.env_prefix_name}-ecs-cluster"
}

resource "aws_ecs_cluster_capacity_providers" "this" {
  cluster_name = aws_ecs_cluster.my-ecs-cluster.name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}

resource "aws_cloudwatch_log_group" "this" {
  name = "${var.env_prefix_name}-firelens-log-group"

  tags = {
    Environment = "${var.env_prefix_name}"
  }
}
resource "aws_ecs_task_definition" "my-task-definition" {
  family                   = "${var.env_prefix_name}-task-family"
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  cpu                      = var.ecs_cpu
  memory                   = var.ecs_memory
  requires_compatibilities = ["FARGATE"]
  lifecycle {
    ignore_changes = all
  }
  container_definitions = <<DEFINITION
[
   {
            "essential": true,
            "image": "906394416424.dkr.ecr.us-west-2.amazonaws.com/aws-for-fluent-bit:latest",
            "name": "log_router",
            "firelensConfiguration": {
                "type": "fluentbit"
            },
            "logConfiguration": {
                "logDriver": "awslogs",
                "options": {
                    "awslogs-group": "${var.env_prefix_name}-firelens-log-group",
                    "awslogs-region": "${var.region}",
                    "awslogs-create-group": "true",
                    "awslogs-stream-prefix": "firelens"
                }
            },
            "memoryReservation": 50
         },
         {
             "essential": true,
             "image":"${var.ecs_docker_image}",
             "name": "${var.env_prefix_name}-container",
             "logConfiguration": {
                 "logDriver":"awsfirelens",
                 "options": {
                    "Name": "es",
                    "Host": "${aws_elasticsearch_domain.os.endpoint}",
                    "Port": "443",
                    "Index": "logstash",
                    "Type": "_doc",
                    "AWS_Auth": "On",
                    "AWS_Region": "${var.region}",
                    "tls": "On"
                }
            },
            "memoryReservation": 300        
      }

]
 DEFINITION
depends_on = [
  aws_elasticsearch_domain.os
]
}

####################################################################
############################ECS-SERVICE#############################
####################################################################
resource "aws_ecs_service" "main" {
  name                               = "${var.env_prefix_name}-ecs-service"
  cluster                            = aws_ecs_cluster.my-ecs-cluster.id
  task_definition                    = aws_ecs_task_definition.my-task-definition.arn
  desired_count                      = var.ecs_desired_count
  deployment_minimum_healthy_percent = var.ecs_min_healthy_percent
  deployment_maximum_percent         = var.ecs_max_healthy_percent
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"

  network_configuration {
    security_groups  = [aws_security_group.ecs_sg.id]
    subnets          = "${var.private_subnets}"
    assign_public_ip = false
  }
  service_registries {

    registry_arn = aws_service_discovery_service.this.arn
    port         = var.ecs_containerPort
  }

  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }

  depends_on = [
    aws_service_discovery_service.this
  ]

}