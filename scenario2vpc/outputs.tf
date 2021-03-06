/*
Output of ips and ids for the created instances
*/
output "instance_ips" {
  value = "${aws_instance.web.*.public_ip}"
}

output "instance_ids" {
  value = "${aws_instance.web.*.id}"
}
