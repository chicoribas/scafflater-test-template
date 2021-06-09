variable "bucket-name" {
  type        = string
  description = "bucket name"
  default = "{{prompt.bucket-name}}"
}

variable "AWS_DEFAULT_REGION" {
  type        = string
  description = "AWS DEFAULT REGION"
  default = "{{prompt.AWS_DEFAULT_REGION}}"
}
