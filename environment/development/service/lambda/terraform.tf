terraform {
  backend "local" {
    path = "../state/development/service/lambda/terraform.tfstate"
  }
}