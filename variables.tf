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