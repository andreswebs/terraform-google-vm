
resource "google_compute_address" "ext" {
  count        = var.assign_external_ip ? 1 : 0
  name         = local.external_ip_name
  region       = local.region
  address_type = "EXTERNAL"
}

resource "google_compute_address" "int" {
  name         = local.internal_ip_name
  region       = local.region
  subnetwork   = data.google_compute_subnetwork.this.id
  address_type = "INTERNAL"
}

resource "google_compute_disk" "this" {
  for_each = local.extra_disks

  name = each.value.name
  type = each.value.type
  zone = each.value.zone
  size = each.value.size

  snapshot = each.value.snapshot

  lifecycle {
    ignore_changes = [
      snapshot
    ]
  }

}

resource "google_compute_instance" "this" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  hostname     = local.hostname

  tags = compact(concat([var.name], var.network_tags))

  metadata_startup_script = var.metadata_startup_script
  metadata                = var.metadata

  boot_disk {
    initialize_params {
      size  = var.disk_size
      image = local.initial_disk_image
    }
  }

  dynamic "attached_disk" {
    for_each = google_compute_disk.this
    content {
      source      = attached_disk.value.self_link
      device_name = attached_disk.key
      mode        = "READ_WRITE"
    }
  }

  network_interface {
    subnetwork = data.google_compute_subnetwork.this.name
    network_ip = google_compute_address.int.address

    dynamic "access_config" {
      for_each = var.assign_external_ip ? [1] : []
      content {
        nat_ip = google_compute_address.ext[0].address
      }
    }
  }

  service_account {
    email  = local.service_account.email
    scopes = ["cloud-platform"]
  }

  lifecycle {
    ignore_changes = [
      boot_disk[0].initialize_params[0].image
    ]
  }

}
