module "{{prompt.name}}" {
  source              = "{{targetPath}}/{{parameters.name}}"
  bucket-name         = var.ASSETS_BUCKET_CMS_NAME
  AWS_DEFAULT_REGION  = var.AWS_DEFAULT_REGION
}