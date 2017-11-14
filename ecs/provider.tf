provider "aws" {
  shared_credentials_file = "/Users/aclaypool/.aws/credentials"
  profile = "personal"
  region = "${var.aws_region}"
  assume_role {
    role_arn     = "arn:aws:iam::465770882877:role/role-thingy-thing"
    session_name = "terraform_ecs"
  }
}
