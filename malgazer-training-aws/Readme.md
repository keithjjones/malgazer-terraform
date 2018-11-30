
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| access_key | Your AWS access key. | string | - | yes |
| ami | The AWS AMI. | string | - | yes |
| availability_zone | The AWS availability zone. | string | - | yes |
| home_ip | Your home IP where you will be connecting from, for security groups. | string | - | yes |
| instance_type | The AWS instance type. | string | - | yes |
| region | The AWS region. | string | - | yes |
| root_ebs_size | The root EBS size of your spot instance. | string | - | yes |
| secret_key | Your AWS secret key. | string | - | yes |
| spot_price | The maximum price you are willing to pay for the spot instance. | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| public_ip_address | Output public IP address for each Virtual Machine. |

