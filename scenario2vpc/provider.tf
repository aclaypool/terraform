/*
provider information pulled from command line variables
*/
provider "aws" {
  access_key = "${var.key}"
  secret_key = "${var.secret}"
  region = "${var.aws_region}"
}
