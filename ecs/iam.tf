resource "aws_iam_role" "ecs_task_execution_role" {
  name = "${var.env_prefix_name}-task-executaion-role"

  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "ecs-tasks.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ecs-task-execution-role-policy-attachment" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_policy" "ecs_to_s3_policy" {
  name        = "${var.env_prefix_name}-s3-policy"
  description = "Policy that allows access to Other Services"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*"
            ],
            "Resource": "*"
        }
    ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "ecs-task-execution-s3-policy-attachment" {
  role       = aws_iam_role.ecs_task_execution_role.name
  depends_on = [aws_iam_policy.ecs_to_s3_policy]
  policy_arn = aws_iam_policy.ecs_to_s3_policy.arn
}

resource "aws_iam_role" "ecs_task_role" {
  name = "${var.env_prefix_name}-task-role"

  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "ecs-tasks.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}




resource "aws_iam_policy" "ecs_task_policy" {
  name        = "${var.env_prefix_name}-task-policy"
  description = "Policy that allows access to Other Services"

  policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
       {
           "Effect": "Allow",
           "Action": [
               "dynamodb:CreateTable",
               "dynamodb:UpdateTimeToLive",
               "dynamodb:PutItem",
               "dynamodb:DescribeTable",
               "dynamodb:ListTables",
               "dynamodb:DeleteItem",
               "dynamodb:GetItem",
               "dynamodb:Scan",
               "dynamodb:Query",
               "dynamodb:UpdateItem",
               "dynamodb:UpdateTable",
               "s3:*",
               "s3-object-lambda:*"
           ],
           "Resource": "*"
       }
   ]
}

EOF

}
resource "aws_iam_role_policy_attachment" "ecs-task-role-policy-attachment" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = aws_iam_policy.ecs_task_policy.arn
}

resource "aws_iam_policy" "policy" {
  name        = "fluent-bit-policy"
  description = "Fluent Bit Policy"

  policy = <<EOT
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "es:ESHttp*"
            ],
            "Resource": "arn:aws:es:${var.region}:${data.aws_caller_identity.current.account_id}:domain/${var.os_domain_name}",
            "Effect": "Allow"
        }
    ]
}
EOT
}