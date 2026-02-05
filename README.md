# terraform-google-vm

Create a VM in GCP.

[//]: # (BEGIN_TF_DOCS)


## Usage

Example:

```hcl
module "vm" {
  source      = "github.com/andreswebs/terraform-google-vm"
  name        = var.name
  zone        = var.zone
  domain_name = var.domain_name
}
```



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_architecture"></a> [architecture](#input\_architecture) | CPU architecture | `string` | `"amd64"` | no |
| <a name="input_assign_external_ip"></a> [assign\_external\_ip](#input\_assign\_external\_ip) | (Optional) Whether to assign an external IP address to the instance | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | VM description | `string` | `null` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Boot disk size | `number` | `50` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | (Optional) Domain name used for the host | `string` | `""` | no |
| <a name="input_external_access_ip_whitelist"></a> [external\_access\_ip\_whitelist](#input\_external\_access\_ip\_whitelist) | List of IPs allowed to SSH | `list(string)` | `[]` | no |
| <a name="input_external_ip_name"></a> [external\_ip\_name](#input\_external\_ip\_name) | Name for the external IP address resource | `string` | `""` | no |
| <a name="input_extra_disks"></a> [extra\_disks](#input\_extra\_disks) | (Optional) List of additional disks to attach to the instance | <pre>list(object({<br/>    name        = string<br/>    description = optional(string, null)<br/>    type        = optional(string, "pd-ssd")<br/>    size        = optional(number, 50)<br/>    snapshot    = optional(string, null)<br/>    labels      = optional(map(string), null)<br/>  }))</pre> | `[]` | no |
| <a name="input_firewall_allow_ssh"></a> [firewall\_allow\_ssh](#input\_firewall\_allow\_ssh) | (Optional) Allow external SSH traffic? | `bool` | `false` | no |
| <a name="input_firewall_allow_web"></a> [firewall\_allow\_web](#input\_firewall\_allow\_web) | (Optional) Allow external web traffic (HTTP and HTTPS)? | `bool` | `false` | no |
| <a name="input_initial_disk_image"></a> [initial\_disk\_image](#input\_initial\_disk\_image) | VM initial disk image | `string` | `""` | no |
| <a name="input_internal_ip_name"></a> [internal\_ip\_name](#input\_internal\_ip\_name) | Name for the internal IP address resource | `string` | `""` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | Machine type | `string` | `"e2-standard-2"` | no |
| <a name="input_metadata"></a> [metadata](#input\_metadata) | (Optional) Set the `metadata` attribute on the `google_compute_instance` resource | `map(string)` | `{}` | no |
| <a name="input_metadata_startup_script"></a> [metadata\_startup\_script](#input\_metadata\_startup\_script) | (Optional) Set the `metadata_startup_script` attribute on the `google_compute_instance` resource | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | VM name | `string` | n/a | yes |
| <a name="input_network_tags"></a> [network\_tags](#input\_network\_tags) | Additional VM network tags | `list(string)` | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | Compute region | `string` | `null` | no |
| <a name="input_service_account_account_id"></a> [service\_account\_account\_id](#input\_service\_account\_account\_id) | (Optional) Account ID for the service account | `string` | `""` | no |
| <a name="input_service_account_default_roles"></a> [service\_account\_default\_roles](#input\_service\_account\_default\_roles) | Default IAM roles to assign to the VM service account | `list(string)` | <pre>[<br/>  "roles/logging.logWriter",<br/>  "roles/monitoring.metricWriter",<br/>  "roles/cloudtrace.agent"<br/>]</pre> | no |
| <a name="input_service_account_description"></a> [service\_account\_description](#input\_service\_account\_description) | (Optional) Description for the service account | `string` | `""` | no |
| <a name="input_service_account_display_name"></a> [service\_account\_display\_name](#input\_service\_account\_display\_name) | (Optional) Display name for the service account | `string` | `""` | no |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | (Optional) Email of an existing service account | `string` | `""` | no |
| <a name="input_service_account_roles"></a> [service\_account\_roles](#input\_service\_account\_roles) | Default IAM roles to assign to the VM service account | `list(string)` | `[]` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | (Optional) Allowed SSH keys formatted as a newline separated list | `string` | `""` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Name of the subnet to use | `string` | `"default"` | no |
| <a name="input_zone_index"></a> [zone\_index](#input\_zone\_index) | n/a | `number` | `0` | no |

## Modules

No modules.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip"></a> [external\_ip](#output\_external\_ip) | Instance external IP |
| <a name="output_hostname"></a> [hostname](#output\_hostname) | Instance hostname |
| <a name="output_instance"></a> [instance](#output\_instance) | The `google_compute_instance` resource |
| <a name="output_internal_ip"></a> [internal\_ip](#output\_internal\_ip) | Instance internal IP |
| <a name="output_service_account"></a> [service\_account](#output\_service\_account) | The `google_service_account` resource |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 7.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.14 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 7.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_address.ext](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_address.int](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_disk.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk) | resource |
| [google_compute_firewall.external_ssh](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.external_web](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_instance.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_project_iam_member.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_compute_image.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_image) | data source |
| [google_compute_subnetwork.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_subnetwork) | data source |
| [google_compute_zones.available](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones) | data source |
| [google_project.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |
| [google_service_account.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account) | data source |

[//]: # (END_TF_DOCS)