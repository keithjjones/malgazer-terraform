
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| client_id | Azure client ID | string | - | yes |
| client_secret | Azure client secret | string | - | yes |
| home_ip | Home IP range to open | string | - | yes |
| mount_data_cmd | The command to mount the training data | string | - | yes |
| region | The region to deploy | string | - | yes |
| resource_group | The resource group | string | - | yes |
| subscription_id | Azure subscription ID | string | - | yes |
| tenant_id | Azure tenant ID | string | - | yes |
| vm_password | VM password for ssh | string | - | yes |
| vm_size | VM size | string | - | yes |
| vm_username | VM username for ssh | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| public_fqdn | The FQDN of the resource. |
| public_ip_address | Output public IP address for each Virtual Machine. |

