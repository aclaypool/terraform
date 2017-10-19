/*
variable breakdown for all resource calls

REQUIRED VARIABLES
aws_profile - the name of the aws profile in the aws credentials file
aws_ssh_key_name - the name of the ssh key you wish to use in AWS
public_ip - public ip of your current network to allow terraform ssh for bootstrap
ssh_key - local location of private ssh key used to ssh into hosts

OPTIONAL VARIABLES
ami - Amazon managed ECS AMI Ids by region
aws_cred - local file location of the aws credentials file you wish to use ~/.aws/credentials is typical location
aws_region - desired region to deploy
common_tags - map of tags to be applied to items in the project
drive_size - desired instance root volume size
drive_iops - desired iops (standard, gp2, io1)
inst_count - number of instances you would like to watch
inst_size - desired size of instance
name - a string to be added to the front of all "Name" tagging
new_key - boolean if you want to upload a new key
priv_subnet - CIDR block for private subnet
pub_file - file location of a pub ssh key if you want to upload a new ssh key
pub_subnet - CIDR block for public subnet
vpc_cidr - CIDR block for entire VPC

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
variable "aws_creds" {
  description = "Local location of AWS credentials file"
  default = "~/.aws/credentials"
}
variable "aws_profile" {
  description = "Name of profile in the AWS credentials file"
}
variable "aws_region" {
  description = "AWS Desired Region"
  default = "us-east-1"
}
variable "aws_ssh_key_name" {
  description = "Name of the key that you wish to use."
}
variable "common_tags" {
  description = "AWS tags to be applied to all items"
  type = "map"
  default = {
    created-by = "adam.claypool@tempus.com"
    project = "provide proof of ability to do cloudy type things"
    environment = "straight to production"
  }
}
variable "drive_iops" {
  description = "The IOPs required for this instance"
  default = "standard"
}
variable "drive_size" {
  description = "Hard drive size for each of the instances you wish to launch"
  default = 10
}
variable "inst_count" {
  description = "Number of instances you wish to launch"
  default = 1
}
variable "inst_size" {
  description = "Size of AWS instance you wish to launch"
  default = "t2.nano"
}
variable "name"{
  description = "Name that you want to be applied to the Name tag of associated items"
  default = "New"
}
variable "new_key" {
  description = "Boolean if you are uploading a new key or not."
  default = false
}
variable "priv_subnet" {
  description = "CIDR block for the private subnet you wish to use"
  default = "10.0.0.0/24"
}
variable "pub_file" {
  description = "If you are uploading a new ssh key with car new_key set to true you will need to supply the public key."
  default = "~/.ssh/new_aws.pub"
}
variable "pub_subnet" {
  description = "CIDR block for the public subnet you wish to use"
  default = "10.0.1.0/24"
}
variable "public_ip" {
  description = "The public IP that you wish to have ssh access into the machine"
}
variable "ssh_key" {
  description = "Local location of ssh key you will use to ssh into host post launcy"
}
variable "vpc_cidr" {
  description = "CIDR block for the entire VPC"
  default = "10.0.0.0/16"
}















