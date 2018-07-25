resource "aws_key_pair" "training" {
  key_name   = "trainingkey"
  public_key = "${file("mykey.pub")}"
}
