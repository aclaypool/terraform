/*
variable breakdown for all resource calls

key - AWS access key required for account (required)
secret - AWS secret required for account (required)
public_ip - public ip of your current network to allow terraform ssh for bootstrap (required)

ami - Amazon managed ECS AMI Ids by region
aws_reion - Desired region to deploy
common_tags - map of tags to be applied to items in the project
inst_count - number of instances you would like to watch
ssh_key - file location of private ssh key pem
pub_file - file location of a pub ssh key if you want to upload a new ssh key
new_key - boolean if you want to upload a new key
key_name - name of the key that you want to use for the AWS instance
inst_size - desired size of instance
drive_size - desired instance root volume size
drive_iops - desired iops (standard, gp2, io1)

*/
variable "ami" {
  description = "AWS ECS AMI ID"
  default = {
	us-east-2   =   "ami-34032e51"
	us-east-1   =   "ami-ec33cc96"
	us-west-2   =   "ami-29f80351"
	us-west-1   =   "ami-d5d0e0b5"
	eu-west-2   =   "ami-eb62708f"
	eu-west-1   =   "ami-13f7226a"
	eu-central-1  =   "ami-40d5672f"
	ap-northeast-2  =   "ami-7ee13b10"
	ap-northeast-1  =   "ami-21815747"
	ap-southeast-2  =   "ami-4f08e82d"
	ap-southeast-1  =   "ami-99f588fa"
	ca-central-1  =   "ami-9b54edff"
  }
}

variable "aws_region" {
  description = "AWS Desired Region"
  default = "us-east-1"
}

variable "common_tags" {
	type = "map"
	default = {
		created-by = "adam.claypool@tempus.com"
		project = "provide proof of ability to do cloudy type things"
		environment = "straight to production"
	}
}

variable "key" {}
variable "secret" {}
variable "inst_count" {
  default = 1
}

variable "ssh_key" {
  default = "~/.ssh/new_aws.pem"
}

variable "pub_file" {
  default = "~/.ssh/new_aws.pub"
}

variable "new_key" {
  default = false
}

variable "key_name" {
  default = "new_aws"
}

variable "inst_size" {
  default = "t2.nano"
}

variable "drive_size" {
  default = 10
}

variable "drive_iops" {
  default = "standard"
}

variable "public_ip" {}
