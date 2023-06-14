module "dpp-myscheduling-cloudwatch-log-group" {
  source            = "git::https://github.com/cahcommercial/dpp-infrastructure-as-code.git//terraform/cloudwatch-log-group?ref=main"
  log_group_name    = var.log_group_name
  retention_in_days = var.retention_in_days
  tags              = var.tags
}
