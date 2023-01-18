variable "env_prefix_name"{
  type        =  string 
}

variable "vpc_id"{
  type        =  string 
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
  type = string
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