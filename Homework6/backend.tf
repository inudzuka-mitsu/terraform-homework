terraform {
  backend "s3" {
    bucket = "valeriia-terra-rem-be"
    key    = "statefiles/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "terra-rem-state"
  }
}
