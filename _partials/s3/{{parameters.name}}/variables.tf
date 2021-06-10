variable "bucket-name" {
  type        = string
  description = "bucket name"
  default = "{{parameters.bucket-name}}"
}

variable "AWS_DEFAULT_REGION" {
  type        = string
  description = "AWS DEFAULT REGION"
  default = "{{parameters.AWS_DEFAULT_REGION}}"
}
