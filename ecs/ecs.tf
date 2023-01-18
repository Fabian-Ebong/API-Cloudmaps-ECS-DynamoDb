resource "aws_ecs_cluster" "my-test-cluster"{
  name = "${var.env_prefix_name}-ecs-cluster"
}

resource "aws_ecs_cluster_capacity_providers" "this" {
  cluster_name = aws_ecs_cluster.my-test-cluster.name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}

resource "aws_cloudwatch_log_group" "this" {
  name = "${var.env_prefix_name}-log-group"

  tags = {
    Environment = "${var.env_prefix_name}"
  }
}
resource "aws_ecs_task_definition" "my-task-definition" {
  family                   = "${var.env_prefix_name}-task-family"
  task_role_arn            =  aws_iam_role.ecs_task_role.arn
  execution_role_arn       =  aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  cpu                      = "${var.ecs_cpu}"
  memory                   = "${var.ecs_memory}"
  requires_compatibilities = ["FARGATE"]

  container_definitions = <<DEFINITION
  [
    {
      "image": "${var.ecs_docker_image}:latest",
      "name": "${var.env_prefix_name}-container",
      "portMappings": [
         {
          "containerPort": ${var.ecs_containerPort},
          "protocol": "tcp",
          "hostPort": ${var.ecs_hostPort}
         }
      ],
      "logConfiguration": {
          "logDriver": "awslogs",
              "options": {
                "awslogs-region": "${var.region}",
                "awslogs-group": "${var.env_prefix_name}-log-group",
                "awslogs-stream-prefix": "ecs"
            }
    	  }
    }
    
  ]
DEFINITION
}

####################################################################
############################ECS-SERVICE#############################
####################################################################
resource "aws_ecs_service" "main" {
 name                               = "${var.env_prefix_name}-ecs-service"
 cluster                            = aws_ecs_cluster.my-test-cluster.id
 task_definition                    = aws_ecs_task_definition.my-task-definition.arn
 desired_count                      = var.ecs_desired_count 
 deployment_minimum_healthy_percent = var.ecs_min_healthy_percent
 deployment_maximum_percent         = var.ecs_max_healthy_percent
 launch_type                        = "FARGATE"
 scheduling_strategy                = "REPLICA"

  network_configuration {
    security_groups  = [aws_security_group.ecs_sg.id]
    subnets          = ["${var.private_subnets}"]
    assign_public_ip = false
  }
  service_registries {

    registry_arn = aws_service_discovery_service.this.arn
    port = var.ecs_containerPort
  }
  
  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }

  depends_on = [
    aws_service_discovery_service.this
  ]
}