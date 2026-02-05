resource "google_service_account" "this" {
  count        = var.service_account_email == "" ? 1 : 0
  account_id   = local.service_account_account_id
  display_name = local.service_account_display_name
  description  = local.service_account_description
}

resource "google_project_iam_member" "this" {
  for_each = toset(var.service_account_default_roles)
  project  = data.google_project.this.project_id
  role     = each.key
  member   = google_service_account.this.member
}
