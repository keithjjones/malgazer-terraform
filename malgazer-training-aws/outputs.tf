output "public_ip_address" {
    description = "Output public IP address for each Virtual Machine."
    value = "${aws_spot_instance_request.malgazer_training_vm.public_ip}"
}
