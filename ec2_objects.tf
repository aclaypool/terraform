/*
Collection of all objects that make of EC2 Instances
aws_key_pair.key - key pair creation if you are uploading a new ssh key for use on these instances
aws_instance.web - ECS docker container instances of variable inst_count
aws_eip.nat - Elastic IP to be used for the NAT Gateway
aws_eip.inst - Elastic IP of variable inst_count to be used as Elastic IPs of the Instances launched
*/
resource "aws_key_pair" "key" {
  count = "${var.new_key}"
  key_name = "${var.key_name}"
  public_key = "${file(var.pub_file)}"
}

resource "aws_instance" "web" {
  ami = "${lookup(var.ami,var.aws_region)}"
  instance_type = "${var.inst_size}"
  subnet_id = "${aws_subnet.public.id}"
  associate_public_ip_address = false
  vpc_security_group_ids = ["${aws_security_group.allow_all_inbound.id}","${aws_security_group.allow_all_outbound.id}","${aws_security_group.allow_all_web.id}","${aws_security_group.allow_ssh.id}"]
  key_name = "${var.key_name}"
  root_block_device {
    volume_type = "${var.drive_iops}"
    volume_size = "${var.drive_size}"
  }
  tags = "${merge(var.common_tags,map("Name","Hello World-${count.index+1}"))}"
  volume_tags = "${merge(var.common_tags,map("Name","Hello World-${count.index+1}"))}"
  count = "${var.inst_count}"
}

resource "aws_eip" "nat" {
  vpc = "True"
}

resource "aws_eip" "inst" {
  vpc = "True"
  count = "${var.inst_count}"
  instance = "${element(aws_instance.web.*.id,count.index)}"
}

