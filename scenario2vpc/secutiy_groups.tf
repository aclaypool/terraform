/*
Resource definition for all required security groups
allow_all_outbound - allow outbound instance traffic to all networks
allow_ssh - allow inbound ssh only from a specific IP
allow_all_web - allow any inbound web traffic
*/
resource "aws_security_group" "allow_all_outbound" {
  name_prefix = "${aws_vpc.main.id}-"
  description = "Allow all outbound traffic"
  vpc_id = "${aws_vpc.main.id}"

  egress = {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = "${merge(var.common_tags,map("Name","${var.name} Allow All Outbound"))}"
}


resource "aws_security_group" "allow_ssh" {
  name_prefix = "${aws_vpc.main.id}-"
  description = "Allow inbound SSH traffic"
  vpc_id = "${aws_vpc.main.id}"

  ingress = {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.public_ip}"]
  }
  tags = "${merge(var.common_tags,map("Name","${var.name} Allow Specific SSH"))}"
}

resource "aws_security_group" "allow_all_web" {
  name_prefix = "${aws_vpc.main.id}-"
  description = "Allow inbound web traffic"
  vpc_id = "${aws_vpc.main.id}"

  ingress = {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress = {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = "${merge(var.common_tags,map("Name","${var.name} Allow All Web"))}"
}
