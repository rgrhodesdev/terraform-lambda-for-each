resource "aws_lambda_function" "bff_service_lambda" {
  for_each = var.lambda_function
    s3_bucket            = "lambda-deployment-bucket-20211020"
    s3_key               = "initial-deployment/main.zip"
    function_name        = "${var.environment}-${each.value.name}"
    handler              = "${each.value.handler}"
    role                 = aws_iam_role.lambda_service_role[each.key].arn
    runtime              = "nodejs14.x"
    memory_size          = "${each.value.memory_size}"
    timeout              = "${each.value.timeout}"

    environment {
      variables = {
        "ENVIRONMENT" = var.environment
      }
      
    }

    tags = {
      Name        = "${var.environment}-${var.service_name}-${each.value.name}"
      Type        = "Lambda"
      Environment = var.environment
      Service     = var.service_name
    }
}