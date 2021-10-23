module lambda_app {

    source = "../../../../modules/service/lambda"

    environment = var.environment
    service_name = var.service_name

    lambda_function = var.lambda_functions

}