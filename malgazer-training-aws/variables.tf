variable "access_key" {
  description = "Your AWS access key."
}

variable "secret_key" {
  description = "Your AWS secret key."
}

variable "region" {
  description = "The AWS region."
}

variable "availability_zone" {
  description = "The AWS availability zone."
}

variable "ami" {
  description = "The AWS AMI."
}

variable "instance_type" {
  description = "The AWS instance type."
}

variable "spot_price" {
  description = "The maximum price you are willing to pay for the spot instance."
}

variable "root_ebs_size" {
  description = "The root EBS size of your spot instance."
}

variable "home_ip" {
  description = "Your home IP where you will be connecting from, for security groups."
}
