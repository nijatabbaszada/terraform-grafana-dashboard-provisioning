
variable "grafana_admin_password" {
    type = string
    sensitive = true
}


variable "grafana_user" {
    type = string 
}
variable "prometheus_uid" {
  type        = string
  description = "UID of Prometheus-compatible datasource"
}
