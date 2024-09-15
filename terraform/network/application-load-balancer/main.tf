module "application-load-balancer" {
  source = "../../modules/network/application-load-balancer"
  region = var.region
  owner = var.owner
  name = var.name
  project = var.project
}
