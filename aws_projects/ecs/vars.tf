#------------------------------------------------------------------------------
# ECS CLUSTER
#------------------------------------------------------------------------------
variable "name" {
  description = "The name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
  type        = string
  default     = "jotonia"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource tags"
}

variable "container_port" {
  default = 80
}

variable "container_environment" {
  default = "dev"
}

variable "container_image" {
  default = "nginx"
}

variable "environment" {
  default = "dev"
} 