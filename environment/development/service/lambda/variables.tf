variable "environment" {
        type = string
        default = "development"
}

variable "service_name" {
        type = string
        default = "web"
}

variable "lambda_functions" {
  description = "Application Lambda Services"
  default = {
    "app-lambda-1" = {
      name                                   = "app-lambda-1"
      handler                                = "app-1.handler"
      memory_size                            = 128
      timeout                                = 5
    }
  }
} 