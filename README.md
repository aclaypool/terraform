# Terraform for Scenario 2 VPC
http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Scenario2.html

#Required Arguments:
-var "key=AKIA...." type: string
-var "secret=...." type: string
-var "public_ip=`curl ifconfig.me`" type: string -executing `curl ifconfig.me` will grab the public IP of your current network and allow it for ssh into hosts

#Optional Arguments:
-var "aws_region=xxxx" type: string
  us-east-2
  us-east-1
  us-west-1
  us-west-2
  ap-south-1
  ap-northeast-2
  ap-southeast-1
  ap-southeast-2
  ap-northeast-1
  ca-central-1
  eu-central-1
  eu-west-1
  eu-west-2
  sa-east-1
-var "common_tags" type: map -any map of common tags to be applied to objects
-var "ssh_key" type: string -file path to the private ssh key used to ssh into instances
-var "new_key" type: boolean -default false.  if true requires both new_key pub_file and key_name to be set 
-var "pub_file" type: string -file path to the pub ssh key if you wish to make a new key pair
-var "key_name" type: string -name of the key you wish to use
-var "inst_size" type: string -default t2.nano. See https://aws.amazon.com/ec2/instance-types/
-var "drive_size" type: int -default 10
-var "drive_iops" type: string -default standard
  standard
  gp2
  io1
