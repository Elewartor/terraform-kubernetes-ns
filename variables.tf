variable "name" {
  description = "Namespace name in K8s"
  type        = string
  default     = "demo"
}


variable "labels" {
  description = "Labels to be used in namespace"
  type        = map(string)
  default = {
    mylabel = "label-value"
  }
}


variable "annotations" {
  description = "Annotations to be used in namespace"
  type        = map(string)
  default = {
    mylabel = "label-value"
  }
}


variable "max_pods" {
  description = "Annotations to be used in namespace"
  type = string
  default = "100"
}


variable PodLimit {
  description = "Please specify pod resource limit"
  type = map(any)
  default = {
    cpu = "500m"
    memory = "1024Mi"
  }
}


variable PersistentVolumeClaimLimit {
  description = "Please specify PersistentVolumeClaim resource limit"
  type = map(any)
  default = {
    storage = "2G"
  }
}


variable ContainerLimit {
  description = "Please specify Container resource limit"
  type = map(any)
  default = {
    cpu    = "500m"
    memory = "1024Mi"
  }
}

