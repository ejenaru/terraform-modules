
variable "environment_variables" {
  description = "Variables de entorno para la Lambda"
  type        = map(string)
  default     = {}
}


variable "service_name" {
  description = "Nombre del servicio que asumirá el rol (por ejemplo, lambda)"
  type        = string
  default     = ""
}

variable "users" {
  description = "Lista de usuarios a crear con políticas personalizadas"
  type = list(object({
    name     = string
    policies = string
    service_name = string
  }))
  default = []
}

variable "roles" {
  description = "Lista de roles a crear con políticas personalizadas"
  type = list(object({
    name     = string
    policies = string
    service_name = string
    custom_trusted_policy = optional(string)

  }))
  default = []
}

