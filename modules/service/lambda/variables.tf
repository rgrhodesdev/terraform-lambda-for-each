variable "environment" {
        description = "Environment"
}

variable "service_name" {
        description = "Service name"
}

variable "lambda_function" {
  description = "BFF Lambda Services"
  default     = {}
  type = map(object({
      name                         = string
      handler = string
      memory_size = number
      timeout = number
  }))
}