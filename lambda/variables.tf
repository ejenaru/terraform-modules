variable "trust_policy" {
  type = string
}

variable "role_policy" {
  type = string
}

variable "resource_name" {
  type = string
}

variable "ecr_repository_name" {
  description = "Nombre del repositorio ECR"
  type        = string
}

variable "environment_variables" {
  description = "Variables de entorno para la Lambda"
  type        = map(string)
  default     = {}
}

variable "timeout" {
  type = number
  default=10
}