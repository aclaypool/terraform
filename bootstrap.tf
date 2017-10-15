/*
null_resource to bootstrap instances to ssh and provision
count based on input variable inst_count
trigger on elastic ip availability
host ips from elastic ip list
private key from ssh_key variable
sleep in sh command due to dockerd not being up immediately as soon as ssh available
*/
resource "null_resource" "bootstrap" {
  count = "${var.inst_count}"
  triggers {
    instance_ids = "${join(",",aws_eip.inst.*.public_ip)}"
  }
  provisioner "remote-exec" {
    connection {
      user = "ec2-user"
      host = "${element(aws_eip.inst.*.public_ip,count.index)}"
      private_key = "${file(var.ssh_key)}"
      timeout = "4m"
    }
    inline = "sleep 15s && sudo docker run hello-world"
  }
}
