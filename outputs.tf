/*
output of ips and ids for created instances
*/
output "instance_ips" {
  value = "${aws_eip.inst.*.public_ip}"
}

output "instance_ids" {
  value = "${aws_instance.web.*.id}"
}
