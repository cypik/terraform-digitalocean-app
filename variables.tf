variable "spec" {
  type        = any
  default     = []
  description = "(Required) A DigitalOcean App spec describing the app."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Whether to automatically deploy images pushed to DOCR."
}



