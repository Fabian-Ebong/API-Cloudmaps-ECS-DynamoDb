env_prefix_name          = "dev-ebong"
region                   = "us-east-1"

allow_sg_cidr            = "0.0.0.0/0"
vpc_id                   = "vpc-0c7a72fd929602261"
private_subnets          = "subnet-0994bf83dacbe75f4"

ecs_docker_image         = "nginx"
ecs_cpu                  = 1024
ecs_memory               = 2048    
ecs_containerPort        = 80
ecs_hostPort             = 80
ecs_desired_count        = 1
ecs_min_healthy_percent  = 0
ecs_max_healthy_percent  = 100
