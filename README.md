# Terraform for Scenario 2 VPC
http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Scenario2.html

## Usage
A terraform init may be required if you do not have the AWS and NULL plugins already installed.

This script assumes that you have aws credentials in an aws credentials file per AWS' documentation
http://docs.aws.amazon.com/cli/latest/userguide/cli-config-files.html

* ``` sh terraform plan -var 'ssh_key=~/.ssh/KEY.pem' -var "public_ip=`curl ifconfig.me`/32" -var 'key_name=KEY' -var 'aws_profile=PRODUCTION' ```
* ``` sh terraform apply -var 'ssh_key=~/.ssh/KEY.pem' -var "public_ip=`curl ifconfig.me`/32" -var 'key_name=KEY' -var 'aws_profile=PRODUCTION' ```

### Required Arguments:
* -var "aws_profile=..."
  * type:
    * string
  * notes
    * Name of the profile you wish to use in your aws credentials file
* -var "aws_creds=~\.aws\credentials"
  * type:
    * string
  * notes
    * The AWS credentials file for your.  http://docs.aws.amazon.com/cli/latest/userguide/cli-config-files.html
* -var "public_ip=..."
  * type:
    * string
  * notes
    * executing ```sh -var "public_ip=`curl ifconfig.me`" ``` will grab the public IP of your current network and allow it for ssh into hosts
* -var "ssh_key= "
  * type:
    * string
  * notes
    * File path to the private ssh key used to ssh into instances

### Optional Arguments:
* -var "aws_region=xxxx"
  * type:
    * string
  * options:
    * us-east-2
    * us-east-1
    * us-west-1
    * us-west-2
    * ap-south-1
    * ap-northeast-2
    * ap-southeast-1
    * ap-southeast-2
    * ap-northeast-1
    * ca-central-1
    * eu-central-1
    * eu-west-1
    * eu-west-2
    * sa-east-1
* -var "common_tags= "
  * type:
    * map
  * notes
    * any map of common tags to be applied to objects
* -var "drive_size= "
  * type:
    * int
  * notes
    * default 10
* -var "drive_iops= "
  * type:
    * string
  * notes
    * default standard
  * options:
    * standard
    * gp2
    * io1
* -var "inst_count= "
  * type:
    * int
  * notes
    * default 1.  Please ensure that service limits on your account can accomodate chosen number.
* -var "inst_size= "
  * type:
    * string
  * notes
    * default t2.nano. See https://aws.amazon.com/ec2/instance-types/
* -var "key_name= "
  * type:
    * string
  * notes
    * name of the key you wish to use
* -var "new_key= "
  * type:
    * boolean
  * notes
    * default false.  if true requires both new_key pub_file and key_name to be set
* -var "priv_subnet= "
  * type:
    * string
  * notes
    * default 10.0.0.0/24. CIDR block for the public subnet
* -var "pub_file= "
  * type:
    * string
  * notes
    * file path to the pub ssh key if you wish to make a new key pair
* -var "pub_subnet= "
  * type:
    * string
  * notes
    * default 10.0.1.0/24. CIDR block for the public subnet
* -var "vpc_cidr= "
  * type:
    * string
  * notes
    * default 10.0.0.0/16. CIDR block for the entire VPC





