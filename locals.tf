locals {
  region                       = data.google_compute_zone.this.region
  hostname                     = var.domain_name != "" ? "${var.name}.${var.domain_name}" : null
  initial_disk_image           = var.initial_disk_image == "" || var.initial_disk_image == null ? data.google_compute_image.this.self_link : var.initial_disk_image
  extra_disks                  = { for each in var.extra_disks : each.name => each }
  internal_ip_name             = var.internal_ip_name != "" ? var.internal_ip_name : "${var.name}-internal"
  external_ip_name             = var.external_ip_name != "" ? var.external_ip_name : "${var.name}-external"
  service_account_account_id   = var.service_account_account_id != "" ? var.service_account_account_id : var.name
  service_account_display_name = var.service_account_display_name != "" ? var.service_account_display_name : var.name
  service_account_description  = var.service_account_description != "" ? var.service_account_description : "Service account for ${var.name} VM"
  service_account              = var.service_account_email != "" ? data.google_service_account.this[0] : google_service_account.this[0]
}
