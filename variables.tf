variable "name" {
  type        = string
  description = "VM name"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet to use"
  default     = "default"
  nullable    = false
}

variable "machine_type" {
  type        = string
  description = "Machine type"
  default     = "e2-standard-2"
  nullable    = false
}

variable "region" {
  type        = string
  description = "Compute region"
}

variable "zone" {
  type        = string
  description = "Compute zone"
}

variable "disk_size" {
  type        = number
  description = "Boot disk size"
  default     = 50
  nullable    = false
}

variable "initial_disk_image" {
  type        = string
  description = "VM initial disk image"
  default     = ""
  nullable    = false
}

variable "network_tags" {
  type        = list(string)
  description = "Additional VM network tags"
  default     = []
  nullable    = false
}

variable "domain_name" {
  type        = string
  description = "(Optional) Domain name used for the host"
  default     = ""
  nullable    = false
}

variable "firewall_allow_ssh" {
  type        = bool
  description = "(Optional) Allow external SSH traffic?"
  default     = false
}

variable "firewall_allow_web" {
  type        = bool
  description = "(Optional) Allow external web traffic (HTTP and HTTPS)?"
  default     = false
}

variable "external_access_ip_whitelist" {
  type        = list(string)
  description = "List of IPs allowed to SSH"
  default     = []
  nullable    = false
}

variable "extra_disks" {
  type = list(object({
    name     = string
    zone     = string
    type     = optional(string, "pd-ssd")
    size     = optional(number, 50)
    snapshot = optional(string, null)
  }))

  description = "(Optional) List of additional disks to attach to the instance"
  default     = []
  nullable    = false
}

variable "metadata_startup_script" {
  type        = string
  description = "(Optional) Set the `metadata_startup_script` attribute on the `google_compute_instance` resource"
  default     = null
}

variable "metadata" {
  type        = map(string)
  description = "(Optional) Set the `metadata` attribute on the `google_compute_instance` resource"
  default     = null
}

variable "assign_external_ip" {
  type        = bool
  description = "(Optional) Whether to assign an external IP address to the instance"
  default     = false
  nullable    = false
}

variable "image_project" {
  type        = string
  description = "(Optional) Project containing the VM image"
  default     = "ubuntu-os-cloud"
  nullable    = false
}

variable "image_family" {
  type        = string
  description = "(Optional) VM image family"
  default     = "ubuntu-2404-lts"
  nullable    = false
}

variable "internal_ip_name" {
  type        = string
  description = "Name for the internal IP address resource"
  default     = ""
  nullable    = false
}

variable "external_ip_name" {
  type        = string
  description = "Name for the external IP address resource"
  default     = ""
  nullable    = false
}

variable "service_account_default_roles" {
  type        = list(string)
  description = "Default IAM roles to assign to the VM service account"
  default = [
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/cloudtrace.agent",
  ]
  nullable = false
}

variable "service_account_account_id" {
  type        = string
  description = "(Optional) Account ID for the service account"
  default     = ""
  nullable    = false
}

variable "service_account_display_name" {
  type        = string
  description = "(Optional) Display name for the service account"
  default     = ""
  nullable    = false
}

variable "service_account_description" {
  type        = string
  description = "(Optional) Description for the service account"
  default     = ""
  nullable    = false
}

variable "service_account_email" {
  type        = string
  description = "(Optional) Email of an existing service account"
  default     = ""
  nullable    = false
}

