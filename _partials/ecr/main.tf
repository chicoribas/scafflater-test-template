

module "{{parameters.name}}" {
  source              = "{{targetPath}}/{{parameters.name}}"
  ecr-name            = "{{parameters.ecr_name}}"
  # como o ecr é criado na shared account, é importante que ele não seja executado em todos os ambientes.
  ecr-enable = var.environment == "development" ? 1 : 0 
  providers = {
    aws = aws.shared_account
  }
}