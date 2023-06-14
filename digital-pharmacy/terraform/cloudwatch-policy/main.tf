module "dpp-myscheduling-cloudwatch-policy" {
  source                 = "git::https://github.com/cahcommercial/dpp-infrastructure-as-code.git//terraform/cloudwatch-policy?ref=main"
  user_name              = var.user_name
  cloudwatch_policy_name = var.cloudwatch_policy_name
}
