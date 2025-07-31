resource "grafana_folder" "folder" {
  for_each = var.grafana_UI_enabled ? {
    for f in local.grafana_folders : f => f
  } : {}

  org_id = 1
  title  = each.key
}

resource "grafana_dashboard" "dashboard" {
  for_each = {
    for d in local.dashboards : d.name => d
  }

  config_json = templatefile(each.value.path, {
    prometheus_uid = var.prometheus_uid
  })

  folder = grafana_folder.folder[each.value.folder].uid
  org_id = 1
}



