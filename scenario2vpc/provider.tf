/*
provider information pulled from command line variables
*/
provider "aws" {
  shared_credentials_file = "${var.aws_creds}"
  region = "${var.aws_region}"
  profile = "${var.aws_profile}"
}
