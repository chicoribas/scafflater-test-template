variable "ASSETS_BUCKET_CMS_NAME" {
 type        = string
 description = "Bucket name to identify resources bucket from application"
 default = "{{parameters.bucket-name}}"
}
