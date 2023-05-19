resource "aws_dynamodb_table" "tasks_table" {
  name           = "Tasks"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "task_id"
  stream_enabled = false

  attribute {
    name = "task_id"
    type = "S"
  }

  global_secondary_index {
    name            = "UserIndex"
    hash_key        = "user_id"
    range_key       = "created_time"
    projection_type = "ALL"
  }

  attribute {
    name = "user_id"
    type = "S"
  }

  attribute {
    name = "created_time"
    type = "N"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = true
  }
}