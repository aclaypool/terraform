/*
A null_resource in order to bootstrap instances via ssh.
The count is based on input variable inst_count in order to enumerate ssh sessions.

Host ips from elastic obtained from elastic IP generated list
Private key provided from the ssh_key variable.
The sleep in sh command due to dockerd not being up immediately as soon as ssh is available.
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
    inline = [
      "sleep 15s && sudo docker run hello-world"
    ]
  }
}
