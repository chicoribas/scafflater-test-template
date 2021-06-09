variable "ecr-name" {
  type        = string
  description = "ecr name"
  default = "{{prompt.ecr-name}}"
}

variable "ecr-enable" {
  type        = number
  description = "conditional check to create ecr"
  default = {{prompt.ecr-enable}}
}
