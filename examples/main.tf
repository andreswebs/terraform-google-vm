module "vm" {
  source      = "github.com/andreswebs/terraform-google-vm"
  name        = var.name
  zone        = var.zone
  domain_name = var.domain_name
}
