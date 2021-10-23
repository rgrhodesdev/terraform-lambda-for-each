module lambda_app {

    source = "../../../../modules/service/lambda_app"

    environment = var.environment
    service_name = var.service_name

    lambda_function = var.lambda_functions

}