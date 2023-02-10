resource "aws_apigatewayv2_vpc_link" "this" {
  name               = "${var.env_prefix_name}-vpc-link"
  security_group_ids = [aws_security_group.vpc_link_securitygroup.id]
  subnet_ids         = var.private_subnets

  tags = {
    Usage = "${var.env_prefix_name}-vpc-link"
  }
}

resource "aws_apigatewayv2_api" "this" {
  name          = "${var.env_prefix_name}-http-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "this" {
  api_id      = aws_apigatewayv2_api.this.id
  name        = "$default"
  auto_deploy = true
}


resource "aws_apigatewayv2_route" "this" {
  api_id    = aws_apigatewayv2_api.this.id
  route_key = "ANY /{proxy+}"

  target = "integrations/${aws_apigatewayv2_integration.this.id}"
}

# resource "aws_apigatewayv2_route" "this" {
#   api_id    = aws_apigatewayv2_api.this.id
#   route_key = "GET /getapp/{proxy+}"

#   target = "integrations/${aws_apigatewayv2_integration.this.id}"
# }

resource "aws_apigatewayv2_integration" "this" {
  api_id           = aws_apigatewayv2_api.this.id
  description      = "CloudMap Integration"
  integration_type = "HTTP_PROXY"
  integration_uri  = aws_service_discovery_service.this.arn

  integration_method = "ANY"
  connection_type    = "VPC_LINK"
  connection_id      = aws_apigatewayv2_vpc_link.this.id

}

