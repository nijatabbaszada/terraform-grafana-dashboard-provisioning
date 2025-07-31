module "grafana-UI" {
  source = "./modules/grafana-UI"

  grafana_UI_enabled = true
  prometheus_uid = var.prometheus_uid
}