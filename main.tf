resource "kubernetes_namespace_v1" "this" {
  metadata {
    name        = var.name
    annotations = var.annotations
    labels      = var.labels
  }
}


# Resource quota applied per namespace
resource "kubernetes_resource_quota_v1" "this" {
  metadata {
    name      = "${var.name}-pod-quota"
    namespace = kubernetes_namespace_v1.this.metadata[0].name
  }

  spec {
    hard = {
      pods = var.max_pods
    }
    scopes = ["BestEffort"]
  }
}


resource "kubernetes_limit_range_v1" "this" {
  metadata {
    name = "${var.name}-limit-range"
    namespace = kubernetes_namespace_v1.this.metadata[0].name
  }
  spec {
    limit {
      type = "Pod"
      max = var.PodLimit
    }
    limit {
      type = "PersistentVolumeClaim"
      max = var.PersistentVolumeClaimLimit
    }
    limit {
      type = "Container"
      max = var.ContainerLimit
    }
  }
}
