##############################################################
# Provider                                                   #
##############################################################
provider "aws" {
  region = var.AWS_DEFAULT_REGION
}

provider "aws" {
  alias = "shared_account"
  region = var.AWS_DEFAULT_REGION
  assume_role {
    role_arn     = "arn:aws:iam::517780235519:role/SharedTerraformAccessRole"
    session_name = "terraform-development-access"
    external_id  = "Terraform"
  }
} 

