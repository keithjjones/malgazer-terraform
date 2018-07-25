# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-interruptions.html#interruption-behavior

resource "aws_spot_instance_request" "malgazer_training_vm" {
  availability_zone = "${var.availability_zone}"
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  user_data = "${file("user-data.txt")}"
  # instance_interruption_behaviour = ""

  spot_price = "${var.spot_price}"
  wait_for_fulfillment = true
  spot_type = "persistent"

  root_block_device {
    volume_size = "${var.root_ebs_size}"
  }

  connection {
    user = "ubuntu"
    private_key = "${file("mykey.pem")}"
    host = "${aws_spot_instance_request.malgazer_training_vm.public_ip}"
  }

}
