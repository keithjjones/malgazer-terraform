resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow all inbound ssh traffic"
  # vpc_id = "${aws_vpc.malgazer_vpc.id}"
  vpc_id = "vpc-4dc0fb24"

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    # cidr_blocks     = ["0.0.0.0/0"]
    cidr_blocks = ["${var.home_ip}/32"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    # prefix_list_ids = ["pl-12c4e678"]
  }
}

# resource "aws_vpc" "malgazer_vpc" {
#   cidr_block = "10.0.0.0/16"
# }
