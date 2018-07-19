variable "subscription_id" {
    description = "Azure subscription ID"
}

variable "tenant_id" {
    description = "Azure tenant ID"
}

variable "client_id" {
    description = "Azure client ID"
}

variable "client_secret" {
    description = "Azure client secret"
}

variable "vm_username" {
    description = "VM username for ssh"
}

variable "vm_password" {
    description = "VM password for ssh"
}

variable "vm_size" {
    description = "VM size"
}

variable "home_ip" {
    description = "Home IP range to open"
}

variable "mount_data_cmd" {
    description = "The command to mount the training data"
}

variable "region" {
    description = "The region to deploy"
}

variable "state_storage_access_key" {
    description = "The key to access the state info on Azure files."
}

variable "state_storage_account_name" {
    description = "The account name for the state info on Azure files."
}
