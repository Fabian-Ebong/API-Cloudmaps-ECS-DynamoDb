env_prefix_name          = "dev-ebong"
region                   = "us-east-1"

# Comma seperated security group 
allow_sg_cidr            = "0.0.0.0/0"
vpc_id                   = "vpc-08982fe9562794148"

# Comma seperated private-subnet values for example "subnet-0994bf83dacbe75f4, subnet-0994bf83dacbe75f4"
private_subnets          = "subnet-01f3ecf19f3a6dbcb"

#Docker Image with version
ecs_docker_image         = "465587469711.dkr.ecr.us-east-1.amazonaws.com/ebong:latest"
ecs_cpu                  = 1024
ecs_memory               = 2048
#Container port and HostPort must be same with Fargate    
ecs_containerPort        = 3000
ecs_hostPort             = 3000
ecs_desired_count        = 1
ecs_min_healthy_percent  = 0
ecs_max_healthy_percent  = 100

#Give s3 bucket name to keep tfstate file.
s3_tfstate_bucket_name   = ""
