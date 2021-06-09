

module "{{prompt.name}}" {
  source              = "{{target.path}}"
  ecr-name            = "{{prompt.ecr_name}}"
  # como o ecr é criado na shared account, é importante que ele não seja executado em todos os ambientes.
  ecr-enable = var.environment == "development" ? 1 : 0 
  providers = {
    aws = aws.shared_account
  }
}