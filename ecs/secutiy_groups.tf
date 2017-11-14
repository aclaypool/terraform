/*
Resource definition for all required security groups
allow_all_outbound - allow outbound instance traffic to all networks
allow_ssh - allow inbound ssh only from a specific IP
allow_all_web - allow any inbound web traffic
*/
resource "aws_security_group" "ecs" {
  name_prefix = "${aws_vpc.main.id}-"
  description = "ECS Security Group"
  vpc_id = "${aws_vpc.main.id}"

  egress = {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress = {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.public_ip}"]
  }

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
