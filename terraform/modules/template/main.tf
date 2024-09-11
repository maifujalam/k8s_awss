resource "resource_type" "resource_type" {
  tags = {
    name = var.name
    owner      = var.owner
    createdBy  = "terraform"
    modulePath = path.module
    CWD        = path.cwd
  }
}
