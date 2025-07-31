terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "~> 3.25.0"
    }
  }
}

provider "grafana" {
  url = local.grafana_url
  auth = "${var.grafana_user}:${var.grafana_admin_password}"
  
}