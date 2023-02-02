## DYNAMODB TABLE ##
resource "aws_dynamodb_table" "this" {
  name             = var.dynamodb_table_name
  hash_key         = var.dynamodb_hash_key
  range_key        = var.dynamodb_range_key
  billing_mode     = var.dynamodb_billing_mode
  stream_enabled   = var.dynamodb_stream_enabled
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = var.dynamodb_hash_key
    type = "S"
  }

  attribute {
    name = var.dynamodb_range_key
    type = "S"
  }

  replica {
    region_name = var.dynamodb_replica_region_name
  }
}


## DYNAMODB TABLE ITEMS ##
resource "aws_dynamodb_table_item" "this" {
  table_name = aws_dynamodb_table.this.name
  hash_key   = aws_dynamodb_table.this.hash_key
  range_key  = aws_dynamodb_table.this.range_key
  
  lifecycle {
    ignore_changes = all
  }

  for_each = {
    "1234abcd" = {
      title    = "Mr"
      fistName = "Jack"
      lastName = "Dorsey"
      projects = ["Twiter", "Square"]
    }
    "34589fsd" = {
      title    = "Mr"
      fistName = "Jack"
      lastName = "MA"
      projects = ["Alibaba", "Ant"]
    }
  }
  item = <<ITEM
{
  "uid": {"S": "${each.key}"},
  "title": {"S": "${each.value.title}"},
  "fistName": {"S": "${each.value.fistName}"},
  "lastName": {"S": "${each.value.lastName}"},
  "projects": {"SS": ${jsonencode(each.value.projects)}}
}
ITEM
}