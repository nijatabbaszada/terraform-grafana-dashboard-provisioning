locals {
    dashboards = [
      {
        name = "Kubernetes Dashboard"
        path = "${path.module}/dashboards/Kubernetes Dashboard.template.json"
        folder = "Kubernetes"
      },
      {
        name = "MinIO Dashboard"
        path = "${path.module}/dashboards/MinIO Dashboard.template.json"
        folder = "MinIO"
      }
  ]

  grafana_folders = distinct([for d in local.dashboards : d.folder])
}