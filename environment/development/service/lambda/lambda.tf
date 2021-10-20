module lambda_service {

    source = "../../../../modules/service/lambda_service"

    environment = var.environment
    service_name = var.service_name

    lambda_service = var.lambda_service

}