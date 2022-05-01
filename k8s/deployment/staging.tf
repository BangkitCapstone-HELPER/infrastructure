module "helper_poc" {
  source                  = "../helper-module"
  namespace               = local.namespace
  deployment_name         = "poc"
  port                    = "80"
}