resource "google_container_node_pool" "gke-nodes" {
  name               = "${var.name}nodes"
  location           = var.zone
  cluster            = var.cluster_name
  initial_node_count = var.initial_node_count
  autoscaling {
    min_node_count   = var.min_node_count
    max_node_count   = var.max_node_count
  }
  management {
    auto_repair  = var.auto_repair
    auto_upgrade = var.auto_upgrade
  }
  version        = var.kube_version
  node_config {
    disk_type    = var.disk_type
    disk_size_gb = var.disk_size
    metadata = {
      disable-legacy-endpoints = "true"
    }
    preemptible  = var.preemptible
    machine_type = var.machine_type
    oauth_scopes = var.oauth_scopes
    tags         = var.network_tags
  }
}
