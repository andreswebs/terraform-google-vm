data "google_compute_zone" "this" {
  name = var.zone
}

data "google_compute_subnetwork" "this" {
  name   = var.subnet_name
  region = local.region
}

data "google_compute_image" "this" {
  project = var.image_project
  family  = var.image_family
}

data "google_service_account" "this" {
  count      = var.service_account_email != "" ? 1 : 0
  account_id = var.service_account_email
}
