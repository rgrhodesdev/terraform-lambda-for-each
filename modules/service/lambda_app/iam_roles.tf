resource "aws_iam_role" "lambda_service_role" {
    for_each = var.lambda_function
      name = "${var.environment}-${var.service_name}-${each.key}-lambda-role"

      assume_role_policy = jsonencode({
          Version = "2012-10-17"
          Statement = [
          {
              Action = "sts:AssumeRole"
              Effect = "Allow"
              Sid    = ""
              Principal = {
              Service = "lambda.amazonaws.com"
              }
          },
          ]
      })

}