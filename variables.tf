################################################################################
# AWS
variable "AWS_DEFAULT_REGION" {
  type        = string
  description = "AWS region in wich resources shall be created"
}

variable "AWS_SECRET_ACCESS_KEY" {
  type        = string
  description = "AWS access key"
}

variable "AWS_ACCESS_KEY_ID" {
  type        = string
  description = "AWS access key ID"
}

################################################################################
# General

variable "environment" {
  type        = string
  description = "Environment name to be appended on resources"
}

variable "vs" {
  type        = string
  description = "Value Stream this project is designed to"
  default = "{{parameters.domain}}"
}

variable "application" {
  type        = string
  description = "Application name to identify resources"
  default = "{{parameters.system}}"
}

variable "team" {
  type        = string
  description = "Team that is responsible for it"
  default = "{{parameters.team}}"
}
