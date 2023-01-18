# resource "aws_service_discovery_private_dns_namespace" "this" {
#   name        = "${var.env_prefix_name}-cloudmap-ns"
#   description = "Namespace of the Cloudmap"
#   vpc         = "${var.vpc_id}"
# }

resource "aws_service_discovery_service" "this" {
  name = "${var.env_prefix_name}-service-descovery"

  dns_config {
    namespace_id = "${var.cloudmap_namespace}" 

    dns_records {
      ttl  = 10
      type = "SRV"
    }

    routing_policy = "MULTIVALUE"
  }

  health_check_custom_config {
    failure_threshold = 3
  }
}
