locals {
  zone                         = data.google_compute_zones.available.names[var.zone_index]
  hostname                     = var.domain_name != "" ? "${var.name}.${var.domain_name}" : null
  initial_disk_image           = var.initial_disk_image == "" ? data.google_compute_image.this[0].self_link : var.initial_disk_image
  extra_disks                  = { for each in var.extra_disks : each.name => each }
  internal_ip_name             = var.internal_ip_name != "" ? var.internal_ip_name : "${var.name}-internal"
  external_ip_name             = var.external_ip_name != "" ? var.external_ip_name : "${var.name}-external"
  service_account_account_id   = var.service_account_account_id != "" ? var.service_account_account_id : var.name
  service_account_display_name = var.service_account_display_name != "" ? var.service_account_display_name : var.name
  service_account_description  = var.service_account_description != "" ? var.service_account_description : "Service account for ${var.name} VM"
  service_account              = var.service_account_email != "" ? data.google_service_account.this[0] : google_service_account.this[0]
  service_account_roles        = compact(concat(var.service_account_default_roles, var.service_account_roles))

  default_image_project = "ubuntu-os-cloud"
  default_image_family  = "ubuntu-2404-lts-${var.architecture}"

  metadata = var.ssh_keys != "" ? merge(var.metadata, {
    ssh-keys = var.ssh_keys
  }) : var.metadata
}
