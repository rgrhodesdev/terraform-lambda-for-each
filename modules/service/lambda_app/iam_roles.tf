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

      inline_policy {

          name = "S3_Policy"

          policy = jsonencode({
          Version = "2012-10-17"
          Statement = [
              {
              Action   = [
                  
                  "logs:CreateLogGroup",
                  "logs:CreateLogStream",
                  "logs:PutLogEvents"
                  
                  ]
              Effect   = "Allow"
              Resource = "*"
              },
                              {
              Action   = [

                  "s3:Get*",
                  "s3:List*"
                  
                  ]
              Effect   = "Allow"
              Resource = [

                  "arn:aws:s3:::lambda-deployment-bucket-20211020/",
                  "arn:aws:s3:::lambda-deployment-bucket-20211020/*"


                  ]
              },
          ]
          })
      }

}