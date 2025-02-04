# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-interruptions.html#interruption-behavior

resource "aws_spot_instance_request" "malgazer_training_vm" {
  availability_zone = "${var.availability_zone}"
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  instance_interruption_behaviour = "stop"
  user_data = "${file("user-data.txt")}"
  # instance_interruption_behaviour = ""
  associate_public_ip_address = "true"
  # security_groups = ["${aws_security_group.allow_ssh.name}"]
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  key_name = "${aws_key_pair.training.key_name}"

  spot_price = "${var.spot_price}"
  wait_for_fulfillment = true
  spot_type = "persistent"

  root_block_device {
    volume_size = "${var.root_ebs_size}"
  }

  connection {
    user = "ubuntu"
    private_key = "${file("mykey.cert")}"
    host = "${aws_spot_instance_request.malgazer_training_vm.public_ip}"
  }

  provisioner "file" {
    source      = "./scripts/build_training.sh"
    destination = "/tmp/build_training.sh"
  }

  provisioner "file" {
    source      = "./scripts/get_training.sh"
    destination = "/tmp/get_training.sh"
  }

  provisioner "file" {
    source      = "./scripts/build_gpu.sh"
    destination = "/tmp/build_gpu.sh"
  }

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo mkdir -p /mnt/virustotal",
  #     "sudo chown -R ${var.vm_username}:${var.vm_username} /mnt/virustotal",
  #     "${var.mount_data_cmd}",
  #     "sudo bash /tmp/build_training.sh"
  #   ]
  # }
}
