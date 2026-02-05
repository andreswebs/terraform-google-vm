data "google_project" "this" {}

data "google_compute_zones" "available" {
  region = var.region
}

data "google_compute_subnetwork" "this" {
  name   = var.subnet_name
  region = var.region
}

data "google_compute_image" "this" {
  count   = var.initial_disk_image == "" ? 1 : 0
  project = local.default_image_project
  family  = local.default_image_family
}

data "google_service_account" "this" {
  count      = var.service_account_email != "" ? 1 : 0
  account_id = var.service_account_email
}
