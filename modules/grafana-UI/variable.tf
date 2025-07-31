variable "grafana_UI_enabled" {
  type        = bool
  default     = false
}

variable "prometheus_uid" {
  type        = string
  description = "UID of Prometheus-compatible datasource"
}
